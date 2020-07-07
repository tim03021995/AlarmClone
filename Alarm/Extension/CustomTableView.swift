//
//  CustomTableView.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/7.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class CustomTableView: UITableView{
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func homePageTableView(){
        self.separatorStyle = .singleLine
               self.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
               self.backgroundColor = .black
               self.allowsMultipleSelection = false
               self.allowsSelection = false
               self.showsVerticalScrollIndicator = true
               self.indicatorStyle = .white
               self.allowsSelectionDuringEditing = true
    }
    
}
