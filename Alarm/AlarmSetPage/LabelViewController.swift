//
//  LabelViewController.swift
//  Alarm
//
//  Created by Alvin Tseng on 2020/6/30.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//

import UIKit

class LabelViewController: BaseViewController,UITextFieldDelegate{
    let fullScreenSize = UIScreen.main.bounds.size
    var getlabel : ((String)->())!
    var label : String?
    lazy var textField = UITextField(frame: CGRect(x: 0, y: 0, width: 5, height: fullScreenSize.height * 0.3))
    override func viewDidLoad() {
        
        textField.delegate = self
        setUpTextField()//
        self.textField.becomeFirstResponder() //第一個聚焦
        textField.addTarget(self, action: #selector(LabelViewController.textFieldTextBeChange), for: .editingChanged)
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        getlabel(label ?? "鬧鐘")
    }
    func setUpTextField(){
        textField.backgroundColor = .backgroundColor2
        textField.text = label ?? ""
        textField.textColor = .white
        textField.keyboardType = .default
        textField.clearButtonMode = .whileEditing
        textField.tintColor = .white
        textField.returnKeyType = .done
        
        self.view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().offset(0)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 結束編輯 把鍵盤隱藏起來
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
        return true
    }
    @objc func textFieldTextBeChange(){
        label = textField.text
    }
    
}
