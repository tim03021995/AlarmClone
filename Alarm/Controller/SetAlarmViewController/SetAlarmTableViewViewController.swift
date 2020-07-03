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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell

        cell.backgroundColor = #colorLiteral(red: 0.2970746748, green: 0.2941127676, blue: 0.2937746721, alpha: 1)
        cell.textLabel?.textColor = .white
  //      if indexPath.section == 1 {
//            if indexPath.row == 0 {
//                cell.accessoryType = .disclosureIndicator
//                cell.detailTextLabel?.text = "永不"
//                cell.detailTextLabel?.textColor = .gray
//            } else if indexPath.row == 1 {
//                cell.accessoryType = .disclosureIndicator
//            } else if indexPath.row == 2 {
//                cell.accessoryType = .disclosureIndicator
//            } else if indexPath.row == 3 {
//                cell.accessoryType = .disclosureIndicator
//            }
   //     }
        
        // 顯示的內容
        if let myLabel = cell.textLabel {
            myLabel.text =
            "\(info[indexPath.row])"
        }
        
        return cell
    }
    
    
    
}
