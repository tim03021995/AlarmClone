//
//  SetAlarmTableViewViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/3.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

//import UIKit
//
//class SetAlarmTableViewViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
//    //回報給父類別的資訊
//    var daysOfWeek: [Bool]?
//    var label:String?
//    var sound : String?
//    var state : Bool?
//    let button = UISwitch(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//    var getDaysOfWeek : (([Bool])->())!
//    var getLabel : ((String)->())!
//    var getState : ((Bool)->())!
//    var reloadTableViewData :(()->Void)!
//    var info = ["重複","標籤","提示聲","稍後提醒"]
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        4
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
//            print("\(info[0])")
//            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "daysOfWeekViewController") as? DaysOfWeekViewController{
//                vc.daysofWeek = self.daysOfWeek ?? [false,false,false,false,false,false,false]
//                vc.getDaysOfWeek = { getData  in
//                self.daysOfWeek = getData
//                }
//                show(vc, sender: nil)
//            }
//        case 1:
//            print("\(info[1])")
//            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "labelViewController") as? LabelViewController{
//                vc.label  = self.label ?? "鬧鐘"
//                vc.getlabel = { getData in
//                    self.label = getData
//                    self.reloadTableViewData()
//                }
//                show(vc, sender: nil)
//            }
//        case 2:
//            print("\(info[2])")
//            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "soundsViewController") as? SoundsViewController{
//                show(vc, sender: nil)
//            }
//        case 3:
//            print("\(info[3])")
//            print(self.state ?? false)
//        default:
//            print("Error")
//        }
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let cell2 = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
//        let cell3 = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
//        let cell4 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
//        
//        setCell(cell: cell1, index: 0, text: "每天")
//        setCell(cell: cell2, index: 1, text: label ?? "鬧鐘")
//        setCell(cell: cell3, index: 2, text: "雷達")
//        setButton(cell: cell4, index: 3, bool: self.state ?? false)
//        switch indexPath.row {
//        case 0:
//            return cell1
//        case 1:
//            return cell2
//        case 2:
//            return cell3
//        case 3:
//            return cell4
//        default:
//            return cell1
//        }
//    }
//    func setCell(cell:UITableViewCell,index:Int,text:String){
//        
//        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
//        let button_1 = UIButton(type: .custom)
//        cell.textLabel?.text = info[index]
//        cell.textLabel?.textColor = .white
//        cell.selectionStyle = .default
//        cell.backgroundColor = .backgroundColor2
//        button_1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        //     button_1.addTarget(self, action: #selector(SetAlarmTableViewViewController.accessoryButtonTapped(sender:)), for: .touchUpInside)
//        button_1.setImage(UIImage(systemName: "chevron.right"), for: .normal)
//        button_1.tintColor = .gray
//        button_1.contentMode = .scaleAspectFit
//        let text1 = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        text1.text = text
//        text1.textColor = .gray
//        view1.addSubview(button_1)
//        view1.addSubview(text1)
//        button_1.snp.makeConstraints { (make) in
//            make.right.equalToSuperview().offset(0)
//            make.centerY.equalToSuperview()
//        }
//        text1.snp.makeConstraints { (make) in
//            make.right.equalTo(button_1).offset(-20)
//            make.centerY.equalTo(button_1)
//        }
//        cell.accessoryView = view1 as UIView
//        cell.selectionStyle = .blue
//        
//    }
//    func setButton(cell:UITableViewCell,index:Int,bool:Bool)  {
//        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
//        cell.textLabel?.text = info[index]
//        cell.textLabel?.textColor = .white
//        cell.backgroundColor = .backgroundColor2
//        button.isOn = bool
//        button.addTarget(self, action: #selector(SetAlarmTableViewViewController.isOpen(sender:)), for: .touchUpInside)
//        view1.addSubview(button)
//        button.snp.makeConstraints { (make) in
//            make.right.equalToSuperview().offset(-10)
//            make.centerY.equalToSuperview()
//        }
//        cell.accessoryView = view1 as UIView
//        cell.selectionStyle = .none
//    }
//    @objc func isOpen(sender : UIButton){
//        self.state = button.isOn
//        getState(self.state!) //讓cloure實作
//    }
//}
//
