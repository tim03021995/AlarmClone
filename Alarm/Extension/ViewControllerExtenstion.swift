//
//  ViewControllerExtenstion.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/2.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//
import UIKit
import Foundation
//extension ViewController : UITableViewDelegate , UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let cellCount  = alarmsArray.count
//        return cellCount
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmCell
//        let timeToString = { (time:Date) -> String in
//            let formatter = DateFormatter()
//            formatter.dateFormat = "hh:mm"
//            let str =
//                formatter.string(from: time)
//            return str
//        }
//        let timeToAM = { (time:Date) -> String in
//            let formatter = DateFormatter()
//            formatter.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
//            formatter.dateFormat = "a"
//            let str =
//                formatter.string(from: time)
//            return str
//        }
//        cell.alarmLabel.text = alarmsArray[indexPath.row].label
//        cell.isAM.text = timeToAM(alarmsArray[indexPath.row].time)
//        cell.alarmTime.text = timeToString(alarmsArray[indexPath.row].time)
//        cell.alarmSwitch.isOn = alarmsArray[indexPath.row].status
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
//        let headerLabel = UILabel(frame: CGRect(x: 15, y: -20,width: headerView.frame.width-10, height: headerView.frame.height-10))
//        headerLabel.text = "鬧豬"
//        headerLabel.font = UIFont.boldSystemFont(ofSize: 35)
//        headerLabel.textColor = .white
//        headerLabel.textAlignment = .left
//        headerView.backgroundColor = .black
//        headerView.addSubview(headerLabel)
//        return headerView
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        10
//    }
//    func  scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (scrollView.contentOffset.y < -50){
//            UIView.animate(withDuration: 0.2) {
//                self.navigationItem.titleView?.alpha = 0
//            }
//        }else{
//            UIView.animate(withDuration: 0.2) {
//                self.navigationItem.titleView?.alpha = 1
//            }
//        }
//    }
//    
//}
