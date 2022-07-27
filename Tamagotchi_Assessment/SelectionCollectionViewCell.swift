//
//  SelectionCollectionViewCell.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import UIKit


extension UILabel {
    
    func ffontAttribute() {
        self.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.font = .boldSystemFont(ofSize: 13)
    }
    
    func bborderAttribute() {
        self.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
    }
}

class SelectionCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "SelectionCollectionViewCell"
    
    @IBOutlet weak var selectionImage: UIImageView!
    @IBOutlet weak var selectionLabel: UILabel!
    
    
    
}
