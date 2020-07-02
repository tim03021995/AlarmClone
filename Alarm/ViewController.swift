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
    var alarmsArray:[Alarm] = []
    var alarmTableView = UITableView()
    var tableViewOnTop:((Bool) -> ())!
    fileprivate func setTableView() {
        self.alarmTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreen.width, height: fullScreen.height), style: .grouped)
        alarmTableView.register(UINib(nibName: "AlarmCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        alarmTableView.separatorStyle = .singleLine
        alarmTableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        alarmTableView.backgroundColor = .black
        alarmTableView.allowsMultipleSelection = false
        alarmTableView.allowsSelection = true
        self.view.addSubview(alarmTableView)
        alarmTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }
    
    override func viewDidLoad() {
        setTableView()
        setupNavigetionBar()
        setupNavigetionBarItem()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //資料模擬
        let onlySunday:[Bool] = [true,false,false,false,false,false,false]
        var alarm1,alarm2,alarm3,alarm4,alarm5,alarm6,alarm7,alarm8,alarm9,alarm10,alarm11,alarm12,alarm13:Alarm
        alarm1 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "鬧鐘1", sound: "雞啼", status: false)
        alarm2 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "鬧鐘2", sound: "雞啼", status: false)
        alarm3 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "鬧鐘3", sound: "雞啼", status: false)
        alarm4 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "起床尿尿", sound: "雞啼", status: true)
        alarm5 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "起床大便", sound: "雞啼", status: true)
        alarm6 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "摸豆芽", sound: "雞啼", status: true)
        alarm7 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "氣功坡", sound: "雞啼", status: true)
        alarm8 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "好想上廁所", sound: "雞啼", status: true)
        alarm9 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "學貓叫", sound: "雞啼", status: true)
        alarm10 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "鬧鐘4", sound: "雞啼", status: true)
        alarm11 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "鬧鐘4", sound: "雞啼", status: true)
        alarm12 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "鬧鐘4", sound: "雞啼", status: true)
        alarm13 = Alarm(time: "12:30", daysOfWeek: onlySunday, label: "鬧鐘4", sound: "雞啼", status: true)
        alarmsArray = [alarm1,alarm2,alarm3,alarm4,alarm5,alarm6,alarm7,alarm8,alarm9,alarm10,alarm11,alarm12,alarm13]
    }
    func setupNavigetionBar (){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setupNavigetionBarItem() {
        let editButton = UIButton(type: .system)
        let addButton = UIButton(type: .system)
        let title = UILabel()
        title.text = "鬧豬"
        title.textColor = .white
        editButton.setTitle("編輯", for:.normal)
        editButton.setTitleColor(.systemOrange, for: .normal)
        editButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        var addImage = UIImage(systemName: "plus")
        addImage = addImage!.withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
        addButton.setImage(addImage, for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.titleView = title
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: editButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }

}
extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellCount  = alarmsArray.count
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmCell
        cell.alarmLabel.text = alarmsArray[indexPath.row].label
        cell.alarmTime.text = alarmsArray[indexPath.row].time
        cell.alarmSwitch.isOn = alarmsArray[indexPath.row].status
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "鬧豬", size: 60)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    func  scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y<0){
            UIView.animate(withDuration: 0.2) {
                self.navigationItem.titleView?.alpha = 0
            }
        }else{
            UIView.animate(withDuration: 0.2) {
                self.navigationItem.titleView?.alpha = 1
            }
        }
    }
    
}
