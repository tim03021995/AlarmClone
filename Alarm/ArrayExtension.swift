//
//  ArrayExtension.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/6.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import Foundation

extension Array{
    //Define 4 type of days
    static var weekend:[Bool] {
        return [true, true, false, false, false, false, false]
    }
    
    static var weekday: [Bool] {
        return [true, true, false, false, false, false, false]
    }
}
