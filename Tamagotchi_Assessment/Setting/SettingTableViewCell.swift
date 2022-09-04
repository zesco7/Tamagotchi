//
//  SettingTableViewCell.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
///Users/macpro15/Downloads/SeSAC2기_Asset/TrendMedia_Assignment/TrendMedia_Assignment.xcodeproj

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    static var identifier = "SettingTableViewCell"

    func configureCell(data: SettingList) {
        self.backgroundColor = .clear
        self.imageView?.image = UIImage(systemName: "\(data.imageName)")
        self.imageView?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.textLabel?.text = data.label
        self.textLabel?.textColor = .black
        self.textLabel?.font = .systemFont(ofSize: 13)
        self.detailTextLabel?.text = data.detailLabel
        self.detailTextLabel?.numberOfLines = 0
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
}
