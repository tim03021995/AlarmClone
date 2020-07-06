//
//  BaseViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/7/4.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    let fullScreen = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundColor 
        setupNavigetionBar()
        //setupNavigetionBarItem()
    }
    func setupNavigetionBar (){
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = .systemOrange
    }
}
