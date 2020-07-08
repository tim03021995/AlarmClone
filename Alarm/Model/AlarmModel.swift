//
//  AlarmModel.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/6/30.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import Foundation
struct Alarm:Codable{
    var time:Date
    var daysOfWeek: [Bool]
    var label:String
    var sound : String
    var status : Bool
    #warning("build  daysOfWeek -> String funtion")
}
/*
 enum Days{
 case 星期日,星期一,星期二,星期三,星期四,星期五,星期六
 }
 */
 
//模擬資料
