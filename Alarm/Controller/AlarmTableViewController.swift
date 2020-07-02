//
//  BaseViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/2.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class AlarmTableViewController: UIViewController {
    let fullScreen = UIScreen.main.bounds.size
    var alarmsArray:[Alarm] = []
    var alarmTableView = UITableView()
    override func viewDidLoad() {
        
        setTableView()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //資料模擬
        let onlySunday:[Bool] = [true,false,false,false,false,false,false]
        let testTime:Date = NSDate() as Date
        var alarm1,alarm2,alarm3,alarm4,alarm5,alarm6,alarm7,alarm8,alarm9,alarm10,alarm11,alarm12,alarm13:Alarm
        alarm1 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "鬧鐘1", sound: "雞啼", status: false)
        alarm2 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "鬧鐘2", sound: "雞啼", status: false)
        alarm3 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "鬧鐘3", sound: "雞啼", status: false)
        alarm4 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "起床尿尿", sound: "雞啼", status: true)
        alarm5 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "起床大便", sound: "雞啼", status: true)
        alarm6 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "摸豆芽", sound: "雞啼", status: true)
        alarm7 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "氣功坡", sound: "雞啼", status: true)
        alarm8 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "好想上廁所", sound: "雞啼", status: true)
        alarm9 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "學貓叫", sound: "雞啼", status: true)
        alarm10 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "鬧鐘4", sound: "雞啼", status: true)
        alarm11 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "鬧鐘4", sound: "雞啼", status: true)
        alarm12 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "鬧鐘4", sound: "雞啼", status: true)
        alarm13 = Alarm(time: testTime, daysOfWeek: onlySunday, label: "鬧鐘4", sound: "雞啼", status: true)
        alarmsArray = [alarm1,alarm2,alarm3,alarm4,alarm5,alarm6,alarm7,alarm8,alarm9,alarm10,alarm11,alarm12,alarm13]
        
    }
    func setTableView() {
        self.alarmTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullScreen.width, height: fullScreen.height), style: .grouped)
        alarmTableView.register(UINib(nibName: "AlarmCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
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
extension  AlarmTableViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellCount  = alarmsArray.count
        return cellCount
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
        cell.alarmLabel.text = alarmsArray[indexPath.row].label
        cell.isAM.text = timeToAM(alarmsArray[indexPath.row].time)
        cell.alarmTime.text = timeToString(alarmsArray[indexPath.row].time)
        cell.alarmSwitch.isOn = alarmsArray[indexPath.row].status
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
