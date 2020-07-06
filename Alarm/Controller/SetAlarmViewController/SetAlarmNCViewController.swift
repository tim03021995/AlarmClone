//
//  SetAlarmNCViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/6.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class SetAlarmNCViewController: UINavigationController {
    var reloadTableViewData :(()->())!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillDisappear(_ animated: Bool) {
        reloadTableViewData()
    }
}
