//
//  DaysOfWeekViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/6/30.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class DaysOfWeekViewController: BaseViewController{
    #warning("info放一個地方")
    let info = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
    var getDaysOfWeek : (([Bool])->())!
    var daysOfWeek : [Bool]?
    #warning("默認值")
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        getDaysOfWeek(daysOfWeek!)
    }
    func setupTableView(){
        #warning("tableview要改")
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreen.width, height: fullScreen.height), style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.backgroundColor = .backgroundColor
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = true
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.indicatorStyle = .white
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.height.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }
}
extension DaysOfWeekViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        #warning("命名")
        if((daysOfWeek![indexPath.row])){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        cell.backgroundColor = .backgroundColor2
        cell.tintColor = .white
        cell.textLabel!.text = info[indexPath.row]
        cell.textLabel!.textColor = .white
        cell.tintColor = .systemOrange
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(info[indexPath.row])")
        #warning("調查 mutating func")
        daysOfWeek![indexPath.row].toggle()
        self.tableView.reloadData()
    }
}

