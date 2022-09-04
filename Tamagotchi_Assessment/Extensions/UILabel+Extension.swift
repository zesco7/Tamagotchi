//
//  UILabel+Extension.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit
/*extension포인트
 -. 공통적으로 적용하려는 뷰의 속성을 함수형태로 미리 정해놓는것이므로 함수안에 필요한 속성을 넣자.(ex. characterNameLabel.fontAttribute())
 -. 개별 속성을 적용하려면 함수로 접근하지 않고 직접 값을 주면 된다.
 */

extension UILabel {
    func labelFontAttribute() {
        self.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.textAlignment = .center
        self.font = .systemFont(ofSize: 13)
    }
    
    func labelBorderAttribute() {
        self.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
}
