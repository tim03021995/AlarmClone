//
//  SetAlarmViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/6/30.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit
import SnapKit

class SetAlarmViewController: UIViewController {
    var daysOfWeekLabel: String?
    var daysOfWeek: [Bool]?
    var label:String?
    var sound : String?
    var status : Bool?
    var time:Date?
    
    let fullScreen = UIScreen.main.bounds.size
    var selectTime = UIDatePicker()
    var menuTableView = UITableView()
    
    let button = UISwitch(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    var info = ["重複","標籤","提示聲","稍後提醒"]
    //
    override func viewDidLoad() {
        self.view.backgroundColor = .backgroundColor
        setupNavigetionBar()
        setupNavigetionBarItem()
        setupSelectTime()
        setupTableView()
        super.viewDidLoad()
    }
    //    override func viewWillDisappear(_ animated: Bool) {
    //        
    //    }
    func setupNavigetionBar (){
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    func setupNavigetionBarItem() {
        //title
        let title = UILabel()
        title.text = "加入鬧鐘"
        title.textColor = .white
        
        //saveButton
        let saveButton = UIBarButtonItem(
            title: "儲存",
            style: .done,
            target: self,
            action: #selector(SetAlarmViewController.save))
        saveButton.tintColor = .systemOrange
        
        //cancelButton
        let cancelButton = UIBarButtonItem(
            title: "取消",
            style: .done,
            target: self,
            action: #selector(SetAlarmViewController.cancel))
        cancelButton.tintColor = .systemOrange
        
        //backButton
        let backButton = UIBarButtonItem(
            title: "返回",
            style: .plain,
            target: self,
            action: #selector(SetAlarmViewController.back))
        
        navigationItem.titleView = title
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.backBarButtonItem = backButton
    }
    func setupSelectTime() {
        selectTime.setValue(UIColor.white, forKeyPath: "textColor")
        selectTime.backgroundColor = .backgroundColor
        selectTime.tintColor = .white
        selectTime.datePickerMode = .time
        selectTime.date = NSDate() as Date
        selectTime.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
        selectTime.addTarget(self, action: #selector(SetAlarmViewController.dateDidSelect), for: .valueChanged)
        //selectTime.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(selectTime)
        selectTime.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(250)
        }
    }
    func setupTableView(){
        self.menuTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreen.width, height: fullScreen.height), style: .plain)
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //  menuTableView.delegate = setAlarmTableViewViewController
        //  menuTableView.dataSource = setAlarmTableViewViewController
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.separatorStyle = .singleLine
        menuTableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        menuTableView.backgroundColor = .backgroundColor
        menuTableView.allowsMultipleSelection = false
        menuTableView.allowsSelection = true
        menuTableView.showsVerticalScrollIndicator = false
        menuTableView.isScrollEnabled = false
        menuTableView.indicatorStyle = .white
        self.view.addSubview(menuTableView)
        menuTableView.snp.makeConstraints { (make) in
            make.top.equalTo(selectTime.snp_bottom).offset(0)
            make.height.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }
    @objc func save (){
        let  alarm = Alarm(
            time:time ?? self.selectTime.date,
            daysOfWeek: daysOfWeek ?? [false,false,false,false,false,false,false],
            label: label ?? "鬧鐘",
            sound: sound ?? "雷達",
            status: status ?? true)
        alarmArray.append(alarm)
        saveAlarm(alarmArray)
        print(#function)
        dismiss(animated: true)
    }
    @objc func cancel (){
        print("取消")
        dismiss(animated: true)
    }
    @objc func dateDidSelect(){
        self.time = selectTime.date
        print("dateChange")
    }
    @objc func back (){
        print(#function)
        self.menuTableView.reloadData()
    }
}
extension SetAlarmViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("\(info[0])")
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "daysOfWeekViewController") as? DaysOfWeekViewController{
                vc.daysofWeek = self.daysOfWeek ?? [false,false,false,false,false,false,false]
                vc.getDaysOfWeek = { getData  in
                    self.daysOfWeek = getData
                    self.daysOfWeekLabel = self.GetDaysOfWeekString(array: self.daysOfWeek!)
                    self.menuTableView.reloadData()
                }
                show(vc, sender: nil)
            }
        case 1:
            print("\(info[1])")
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "labelViewController") as? LabelViewController{
                vc.label  = self.label ?? "鬧鐘"
                vc.getlabel = { getData in
                    self.label = getData
                    self.menuTableView.reloadData()
                }
                show(vc, sender: nil)
            }
        case 2:
            print("\(info[2])")
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "soundsViewController") as? SoundsViewController{
                show(vc, sender: nil)
            }
        case 3:
            print("\(info[3])")
            print(self.status ?? false)
        default:
            print("Error")
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell2 = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        let cell3 = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        let cell4 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        setCell(cell: cell1, index: 0, text: daysOfWeekLabel ?? "永不")
        setCell(cell: cell2, index: 1, text: label ?? "鬧鐘")
        setCell(cell: cell3, index: 2, text: "雷達")
        setButton(cell: cell4, index: 3, bool: self.status ?? false)
        
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
    
    func setCell(cell:UITableViewCell,index:Int,text:String){
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        let button_1 = UIButton(type: .custom)
        cell.textLabel?.text = info[index]
        cell.textLabel?.textColor = .white
        cell.selectionStyle = .default
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
        button.isOn = bool
        button.addTarget(self, action: #selector(SetAlarmViewController.isOpen(sender:)), for: .touchUpInside)
        view1.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        cell.accessoryView = view1 as UIView
        cell.selectionStyle = .none
    }
    @objc func isOpen(sender : UIButton){
        self.status = button.isOn
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
        }
        if (trueNum == 7){
            str =  "每天"
        }
        else if(trueNum == 0){
            str =  "永不"
            
        }else if(trueNum == 1){
            var i = 0
            for trueGuy in array {
                if (trueGuy == true)
                {
                    str = info[i]
                }
                else{
                    i+=1
                }
            }
        }else if(trueNum == 2){
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
        }else{
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
extension SetAlarmViewController{
    func saveAlarm (_ alarmArray:[Alarm]){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alarmArray), forKey:"alarmArray")
    }
}
