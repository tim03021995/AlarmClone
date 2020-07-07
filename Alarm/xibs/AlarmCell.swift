//
//  AlarmCell.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/1.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class AlarmCell: UITableViewCell {

    @IBOutlet weak var isAM: UILabel!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var alarmLabel: UILabel!
    @IBAction func alarmISOpen(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // alarmSwitch.onImage = UIImage(systemName: "chevron.right")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
