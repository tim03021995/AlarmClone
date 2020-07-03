//
//  SetAlarmTableViewViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/3.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class SetAlarmTableViewViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var info = ["重複","標籤","提示聲","稍後提醒"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    @objc func accessoryButtonTapped(sender : UIButton){
        print(sender.tag)
        print("Tapped")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell2 = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        let cell3 = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        let cell4 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        //        cell1.accessoryType = .disclosureIndicator
        //        cell1.backgroundColor = .backgroundColor2
        //        cell1.textLabel?.text = "重複"
        //        cell1.textLabel?.textColor = .white
        //        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        //        let button_1 = UIButton(type: .custom)
        //        button_1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //   //     button_1.addTarget(self, action: #selector(SetAlarmTableViewViewController.accessoryButtonTapped(sender:)), for: .touchUpInside)
        //        button_1.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        //        button_1.tintColor = .gray
        //        button_1.contentMode = .scaleAspectFit
        //        let text1 = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        //        text1.text = "永不"
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
        //        cell1.accessoryView = view1 as UIView
        setCell(cell: cell1, index: 0, text: "每天")
        setCell(cell: cell2, index: 1, text: "鬧鐘")
        setCell(cell: cell3, index: 2, text: "雷達")
        setButton(cell: cell4, index: 3, bool: true)
        switch indexPath.row {
        case 0:
            return cell1
        case 1:
            return cell2
        case 2:
            return cell3
        case 3:
            return cell4
        default:
            return cell1
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    
    
    func setCell(cell:UITableViewCell,index:Int,text:String){
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        let button_1 = UIButton(type: .custom)
        cell.textLabel?.text = info[index]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .backgroundColor2
        button_1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //     button_1.addTarget(self, action: #selector(SetAlarmTableViewViewController.accessoryButtonTapped(sender:)), for: .touchUpInside)
        button_1.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button_1.tintColor = .gray
        button_1.contentMode = .scaleAspectFit
        let text1 = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        text1.text = text
        text1.textColor = .gray
        view1.addSubview(button_1)
        view1.addSubview(text1)
        button_1.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(0)
            make.centerY.equalToSuperview()
        }
        text1.snp.makeConstraints { (make) in
            make.right.equalTo(button_1).offset(-20)
            make.centerY.equalTo(button_1)
        }
        cell.accessoryView = view1 as UIView
        cell.selectionStyle = .blue

    }
    func setButton(cell:UITableViewCell,index:Int,bool:Bool)  {
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        cell.textLabel?.text = info[index]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .backgroundColor2
        let button = UISwitch(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.isOn = bool
        button.addTarget(self, action: #selector(SetAlarmTableViewViewController.accessoryButtonTapped(sender:)), for: .touchUpInside)
        view1.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        cell.accessoryView = view1 as UIView
        cell.selectionStyle = .none
    }
    
    
}
