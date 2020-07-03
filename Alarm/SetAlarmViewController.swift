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
    
    let setAlarmTableViewViewController = SetAlarmTableViewViewController()
    let fullScreen = UIScreen.main.bounds.size
    var selectTime = UIDatePicker()
    var menuTableView = UITableView()
    
    var time:Date?
    var daysOfWeek: [Bool]?
    var label:String?
    var sound : String?
    var status : Bool?
    
    override func viewDidLoad() {
        self.addChild(setAlarmTableViewViewController)
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.backgroundColor = #colorLiteral(red: 0.1097619608, green: 0.1096628532, blue: 0.1179399118, alpha: 1)
        setupNavigetionBar()
        setupNavigetionBarItem()
        setupSelectTime()
        setupTableView()
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
        menuTableView.delegate = setAlarmTableViewViewController
        menuTableView.dataSource = setAlarmTableViewViewController
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
