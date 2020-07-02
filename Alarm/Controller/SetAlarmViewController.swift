//
//  SetAlarmViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/6/30.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class SetAlarmViewController: UIViewController {

    override func viewDidLoad() {
        let fullScreenSize = UIScreen.main.bounds.size
        var info = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
        let myTableView = UITableView(frame: CGRect(
        x: 0, y: 20,
        width: fullScreenSize.width,
        height: fullScreenSize.height - 20),
                                      style: .grouped)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
