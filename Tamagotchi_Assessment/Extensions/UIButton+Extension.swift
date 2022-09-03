//
//  UIButton+Extension.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

extension UIButton {
    func buttonFontAttribute() {
        self.titleLabel?.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = .systemFont(ofSize: 13)
    }
    
    func buttonBorderAttribute() {
        self.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }
}
