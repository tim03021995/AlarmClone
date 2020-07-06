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
}
//struct DaysOfWeek {
//    var  sunday : Bool
//    var monday : Bool
//    var tuesday : Bool
//    var wednesday : Bool
//    var thursday : Bool
//    var friday : Bool
//    var saturday : Bool
//}
//模擬資料
