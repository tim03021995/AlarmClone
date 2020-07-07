//
//  AlarmTableViewViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/3.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit
class AlarmTableViewViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var alarmTableViewIsEditing:Bool = false
    var showNavigationItem :((Bool)->())!
    var reloadTableViewData :(()->())!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellCount  = alarmArray.count
        return cellCount
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let name = alarmArray[indexPath.row]
        if editingStyle == .delete {
            alarmArray.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(
                at: [indexPath], with: .fade)
            tableView.endUpdates()
            print("刪除的是 \(name)")
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmCell
        let timeToString = { (time:Date) -> String in
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm"
            let str =
                formatter.string(from: time)
            return str
        }
        let timeToAM = { (time:Date) -> String in
            let formatter = DateFormatter()
            formatter.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
            formatter.dateFormat = "a"
            let str =
                formatter.string(from: time)
            return str
        }
        //編輯模式的右鍵
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        let button_1 = UIButton(type: .custom)
        button_1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button_1.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button_1.tintColor = .gray
        button_1.contentMode = .scaleAspectFit
        view1.addSubview(button_1)
        button_1.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(0)
            make.centerY.equalToSuperview()
        }
        cell.editingAccessoryView = view1 as UIView
        
        cell.alarmLabel.text = alarmArray[indexPath.row].label + "，" + GetDaysOfWeekString(array: alarmArray[indexPath.row].daysOfWeek)
        cell.isAM.text = timeToAM(alarmArray[indexPath.row].time)
        cell.alarmTime.text = timeToString(alarmArray[indexPath.row].time)
        let alarmSwitch = UISwitch()
        alarmSwitch.isOn = alarmArray[indexPath.row].status
        cell.accessoryView = alarmSwitch
        cell.editingAccessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let headerLabel = UILabel(frame: CGRect(x: 15, y: -20,width: headerView.frame.width-10, height: headerView.frame.height-10))
        headerLabel.text = "鬧豬"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 35)
        headerLabel.textColor = .white
        headerLabel.textAlignment = .left
        headerView.backgroundColor = .black
        headerView.addSubview(headerLabel)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    func  scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (scrollView.contentOffset.y < -50){
            showNavigationItem(false)
        }else{
            showNavigationItem(true)
        }
    }
    func GetDaysOfWeekString(array:[Bool]) -> String {
        var array = array
        var trueNum = 0
        var str:String = ""
        let info = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
        let info2 = ["週一","週二","週三","週四","週五","週六","週日"]
        for num in array{
            if num{
                trueNum += 1
            }
        }//計數有幾個true
        switch trueNum{
        case 7:
            str =  "每天"
        case 0:
            str = "永不"
        case 1:
            var i = 0
            for trueGuy in array {
                if (trueGuy == true)
                {
                    str = info[i]
                    break
                }
                else{
                    i+=1
                }
            }
        case 2:
            if(array[0] == true && array[6] == true ){
                str = "週末"
            }
            else{
                let buffer = array[0]
                array.remove(at: 0)
                array.append(buffer)
                var i = 0
                for trueGuy in array {
                    if (trueGuy == true)
                    {
                        str = str+" "+info2[i]
                        i += 1
                    }
                    else{
                        i+=1
                    }
                }
            }
        default:
            let buffer = array[0]
            array.remove(at: 0)
            array.append(buffer)
            var i = 0
            for trueGuy in array {
                if (trueGuy == true)
                {
                    str = str+" "+info2[i]
                    i += 1
                }
                else{
                    i+=1
                }
            }
        }
        return str
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "setAlarmViewController") as? SetAlarmViewController
        let nc = SetAlarmNCViewController(rootViewController: vc!)
        vc?.daysOfWeek = alarmArray[indexPath.row].daysOfWeek
        vc?.daysOfWeekLabel = GetDaysOfWeekString(array: alarmArray[indexPath.row].daysOfWeek)
        vc?.sound = alarmArray[indexPath.row].sound
        vc?.status = alarmArray[indexPath.row].status
        vc?.label = alarmArray[indexPath.row].label
        vc?.createMode = false
        nc.reloadTableViewData = {
            self.reloadTableViewData()
        }
        show(nc, sender: nil)
        func GetDaysOfWeekString(array:[Bool]) -> String {
            var array = array
            var trueNum = 0
            var str:String = ""
            let info = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
            let info2 = ["週一","週二","週三","週四","週五","週六","週日"]
            for num in array{
                if num{
                    trueNum += 1
                }
            }//計數有幾個true
            switch trueNum{
            case 7:
                str =  "每天"
            case 0:
                str = "永不"
            case 1:
                var i = 0
                for trueGuy in array {
                    if (trueGuy == true)
                    {
                        str = info[i]
                        break
                    }
                    else{
                        i+=1
                    }
                }
            case 2:
                if(array[0] == true && array[6] == true ){
                    str = "週末"
                }
                else{
                    let buffer = array[0]
                    array.remove(at: 0)
                    array.append(buffer)
                    var i = 0
                    for trueGuy in array {
                        if (trueGuy == true)
                        {
                            str = str+" "+info2[i]
                            i += 1
                        }
                        else{
                            i+=1
                        }
                    }
                }
            default:
                let buffer = array[0]
                array.remove(at: 0)
                array.append(buffer)
                var i = 0
                for trueGuy in array {
                    if (trueGuy == true)
                    {
                        str = str+" "+info2[i]
                        i += 1
                    }
                    else{
                        i+=1
                    }
                }
            }
            return str
        }
    }
}
