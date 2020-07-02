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
    var info = ["重複","標籤","提示聲","稍後提醒"]
    let fullScreen = UIScreen.main.bounds.size
    var time:Date?
    var daysOfWeek: [Bool]?
    var label:String?
    var sound : String?
    var status : Bool?
    var selectTime = UIDatePicker()
    var menuTableView = UITableView()
    override func viewDidLoad() {
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.backgroundColor = #colorLiteral(red: 0.1097619608, green: 0.1096628532, blue: 0.1179399118, alpha: 1)
        setupNavigetionBar()
        setupNavigetionBarItem()
        setupSelectTime()
        super.viewDidLoad()
        
    }
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
        
        navigationItem.titleView = title
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
    }
    func setupSelectTime() {
        selectTime.setValue(UIColor.white, forKeyPath: "textColor")
        selectTime.backgroundColor = #colorLiteral(red: 0.1097619608, green: 0.1096628532, blue: 0.1179399118, alpha: 1)
        selectTime.tintColor = .white
        selectTime.datePickerMode = .time
        selectTime.date = NSDate() as Date
        selectTime.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
        selectTime.addTarget(self, action: #selector(SetAlarmViewController.dateDidSelect), for: .valueChanged)
        
        view.addSubview(selectTime)
        selectTime.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(300)
        }
    }
    func setupTableView(){
        self.menuTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreen.width, height: fullScreen.height), style: .grouped)
            menuTableView.register(UINib(nibName: "AlarmCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
            menuTableView.delegate = self
            menuTableView.dataSource = self
            menuTableView.separatorStyle = .singleLine
            menuTableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
            menuTableView.backgroundColor = .black
            menuTableView.allowsMultipleSelection = false
            menuTableView.allowsSelection = false
            menuTableView.showsVerticalScrollIndicator = true
            menuTableView.indicatorStyle = .white
            self.view.addSubview(menuTableView)
            menuTableView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(0)
                make.bottom.equalToSuperview().offset(0)
                make.left.equalToSuperview().offset(0)
                make.right.equalToSuperview().offset(0)
            }
        }
    @objc func save (){
        print("儲存")
    }
    @objc func cancel (){
        print("取消")
        dismiss(animated: true)
    }
    @objc func dateDidSelect(){
        self.time = selectTime.date
        print("dateChange")
    }
    
}
extension SetAlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
       if indexPath.section == 1 {
           if indexPath.row == 0 {
            cell.accessoryType = .checkmark
           } else if indexPath.row == 1 {
            cell.accessoryType = .detailButton
           } else if indexPath.row == 2 {
               cell.accessoryType =
                .detailDisclosureButton
           } else if indexPath.row == 3 {
            cell.accessoryType = .disclosureIndicator
           }
       }

       // 顯示的內容
       if let myLabel = cell.textLabel {
           myLabel.text =
             "\(info[indexPath.row])"
       }

       return cell
    }
    

}
