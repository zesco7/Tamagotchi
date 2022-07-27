//
//  UICollectionViewController+Extension.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import Foundation
import UIKit

extension UICollectionViewController {
    
    func setBackgroundColorForCvc() {
        collectionView.backgroundColor = UIColor(red: 244/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    func setFont(labelName: UILabel) {
        labelName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        labelName.font = .boldSystemFont(ofSize: 13)
    }
}
    
