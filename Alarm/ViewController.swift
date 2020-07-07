//
//  ViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/1.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit
import Firebase
import SnapKit
import UserNotificationsUI
var alarmArray = [Alarm](){
    didSet{
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alarmArray), forKey:"alarmArray")
    }
}
class ViewController: UIViewController{
    let fullScreen = UIScreen.main.bounds.size
    var alarmTableView = UITableView()
    let alarmTableViewController = AlarmTableViewViewController()
    var dayType:[Bool] = []
    override func viewDidLoad() {
        view.backgroundColor = .black
        alarmArray = loadAlarm()
        alarmTableViewController.showNavigationItem = { make  in
            if make{
                UIView.animate(withDuration: 0.2) {
                    self.navigationItem.titleView?.alpha = 1
                }
            }else{
                UIView.animate(withDuration: 0.2) {
                    self.navigationItem.titleView?.alpha = 0
                }
            }
            
        }
        self.addChild(alarmTableViewController)
        setTableView()
        setupNavigetionBar()
        setupNavigetionBarItem()
        
        super.viewDidLoad()
    }
    func setupNavigetionBar (){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setupNavigetionBarItem() {
        //title
        let title = UILabel()
        title.text = "鬧豬"
        title.textColor = .white
        
        //addButton
        var addImage = UIImage(systemName: "plus")
        addImage = addImage!.withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
        let addButton = UIBarButtonItem(
            image: addImage,
            style: .plain,
            target: self,
            action: #selector(ViewController.add))
        
        //editButton
        let editButton = UIBarButtonItem(
            title: "編輯",
            style: .done,
            target: self,
            action: #selector(ViewController.edit))
        editButton.tintColor = .systemOrange
        
        navigationItem.titleView = title
        navigationItem.leftBarButtonItem = editButton
        navigationItem.rightBarButtonItem = addButton
    }
    func setTableView() {
        self.alarmTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreen.width, height: fullScreen.height), style: .grouped)
        alarmTableView.register(UINib(nibName: "AlarmCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
        alarmTableView.delegate = alarmTableViewController
        alarmTableView.dataSource = alarmTableViewController
        alarmTableView.separatorStyle = .singleLine
        alarmTableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        alarmTableView.backgroundColor = .black
        alarmTableView.allowsMultipleSelection = false
        alarmTableView.allowsSelection = false
        alarmTableView.showsVerticalScrollIndicator = true
        alarmTableView.indicatorStyle = .white
        self.view.addSubview(alarmTableView)
        alarmTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }
    func setNotifications(){
        // #1.1 - Create "the notification's category value--its type."
        let debitOverdraftNotifCategory = UNNotificationCategory(identifier: "debitOverdraftNotification", actions: [], intentIdentifiers: [], options: [])
        // #1.2 - Register the notification type.
        UNUserNotificationCenter.current().setNotificationCategories([debitOverdraftNotifCategory])
    }
    @objc func add(){
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "page2") as? SetAlarmNCViewController{
            vc.reloadTableViewData = {
                self.alarmTableView.reloadData()
            }
            present(vc, animated: true)
        }
    }
    @objc func edit (){
        alarmTableView.setEditing(!alarmTableView.isEditing, animated: true)
        if (!alarmTableView.isEditing) {
            // 顯示編輯按鈕
            let editButton = UIBarButtonItem(
                title: "編輯",
                style: .done,
                target: self,
                action: #selector(ViewController.edit))
            editButton.tintColor = .systemOrange
            self.navigationItem.leftBarButtonItem = editButton
            alarmTableViewController.alarmTableViewIsEditing = false
        } else {
            // 顯示編輯完成按鈕
            let doneButton = UIBarButtonItem(
                title: "完成",
                style: .done,
                target: self,
                action: #selector(ViewController.edit))
            doneButton.tintColor = .systemOrange
            self.navigationItem.leftBarButtonItem = doneButton
            alarmTableViewController.alarmTableViewIsEditing = true
        }
    }
}
extension ViewController{
    func loadAlarm () -> [Alarm]{
        if let data = UserDefaults.standard.value(forKey:"alarmArray") as? Data {
            let alarmArray = try? PropertyListDecoder().decode([Alarm].self, from: data)
            return alarmArray!
        }
        else{
            return [Alarm].init()
        }
    }
    func saveAlarm (_ alarmArray:[Alarm]){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alarmArray), forKey:"alarmArray")
    }
    
}
