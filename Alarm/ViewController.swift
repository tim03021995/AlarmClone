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

class ViewController: UIViewController{
    
    let fullScreen = UIScreen.main.bounds.size
    var alarmTableView = UITableView()
    let alarmTableViewController = AlarmTableViewViewController()
    
    override func viewDidLoad() {
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
    @objc func add(){
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "page2") as? UINavigationController{
            present(vc, animated: true)
            // show(vc, sender: nil)
        }
    }
    @objc func edit (){
        
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
}
