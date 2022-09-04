//
//  SettingTableViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let settingInfo = SettingData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingInfo.SettingGeneralData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        
        let data = settingInfo.SettingGeneralData[indexPath.row]
        cell.configureCell(data: data)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RenameViewController") as! RenameViewController
        self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            //메인화면 전환
        } else if indexPath.row == 2 {
            //데이터초기화
        } else {
         return
        }
}
}
