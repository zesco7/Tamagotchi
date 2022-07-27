//
//  UITextField+Extension.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import Foundation
import UIKit

extension UITextField {
    
    func fontAttribute() {
        self.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            }
    
    func borderAttribute() {
        self.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
    }
    
}
