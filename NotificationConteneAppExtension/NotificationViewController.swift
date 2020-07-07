//
//  NotificationViewController.swift
//  NotificationConteneAppExtension
//
//  Created by Alvin Tseng on 2020/7/7.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
