//
//  SettingTableViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit
/*질문
 -. alert함수 만들어서 else if indexPath.row == 2 에 넣으면 왜 실행 안되는지?
 -. alert에서 ok선택했을 때 값은 어떻게 받아오는지? 그게 있어야 첫화면으로 넘길수있음.
 
 */

class SettingTableViewController: UITableViewController {
    
    let settingInfo = SettingData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        navigationItem.title = "설정"
        
    }
    func dataResetAlert() {
        
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
        if indexPath.row == 0 { //이름변경화면 전환
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RenameViewController") as! RenameViewController
        self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 { //메인화면 전환
            
        } else if indexPath.row == 2 { //데이터초기화
            let alert = UIAlertController(title: "데이터 초기화", message: "초기화 된 데이터는 복구할 수 없으니 참고해주세요. 초기화 하시겠어요?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "네. 삭제할게요.", style: .default)
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
            print()
            //UserDefaults.standard.set(ok, forKey: "Settings")
        } else {

         return
        }
}
    

}
