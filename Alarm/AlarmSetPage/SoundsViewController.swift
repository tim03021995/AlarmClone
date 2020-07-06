//
//  SoundsViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/6/30.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit
import SnapKit
class SoundsViewController: BaseViewController{
    let fullScreenSize = UIScreen.main.bounds.size
    var 豆芽 = UIImageView(
    frame: CGRect(
      x: 0, y: 0, width: 100, height: 100))
    


    override func viewDidLoad() {
        豆芽.image = #imageLiteral(resourceName: "12729123_1688637504708783_194075531238617936_n.jpg")
        豆芽.layer.cornerRadius = 30

    self.view.addSubview(豆芽)
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
