//
//  UITextField+Extension.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

extension UITextField {
    
    func textFieldFontAttribute() {
        self.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.font = UIFont.systemFont(ofSize: 13)
    }
    
    func textFieldBorderAttribute() {
        self.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
    }
    
}
