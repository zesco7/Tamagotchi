//
//  SettingTableViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit
/*질문
 -. alert함수 만들어서 else if indexPath.row == 2 에 넣으면 왜 실행 안되는지?
 -.1!! alert에서 ok버튼 눌렀을때 값을 어떻게 받아오는지? 그게 있어야 첫화면으로 넘길수있음 -> 해결: alert 뒤에 { (action) in } 사용
 -.2!! 인덱스가 정해져 있는데 characterImageView.image와 다른 값을 어떻게 UserDefaults에 다시 넣는지? characterImageView.image와 다른 값인걸 어떻게 구분하는지?
 
 */

class SettingTableViewController: UITableViewController, UIApplicationDelegate {
    
    let settingInfo = SettingData()
    let characterData = CharacterData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        navigationItem.title = "설정"

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
            
        } else if indexPath.row == 1 { //!!메인화면 전환
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate =  windowScene?.delegate as? SceneDelegate
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SelectionCollectionViewController") as! SelectionCollectionViewController
            let navi = UINavigationController(rootViewController: vc)
            sceneDelegate?.window?.rootViewController = navi
            sceneDelegate?.window?.makeKeyAndVisible()
            
            //vc.characterChange = characterData.characterGeneralData[indexPath.row]
        
        } else if indexPath.row == 2 { //1!!데이터초기화
            let alert = UIAlertController(title: "데이터 초기화", message: "초기화 된 데이터는 복구할 수 없으니 참고해주세요. 초기화 하시겠어요?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            
            //alert에서 ok버튼 눌렀을 때 첫화면 이동 + 데이터초기화(removeObject)
            let ok = UIAlertAction(title: "네. 삭제할게요.", style: .default) { (action) in
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let sceneDelegate =  windowScene?.delegate as? SceneDelegate
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "SelectionCollectionViewController") as! SelectionCollectionViewController
                let navi = UINavigationController(rootViewController: vc)
                sceneDelegate?.window?.rootViewController = navi
                sceneDelegate?.window?.makeKeyAndVisible()
                
                for key in UserDefaults.standard.dictionaryRepresentation().keys { //UserDefaults 전체 삭제
                            UserDefaults.standard.removeObject(forKey: key.description)
                        }
            }
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        } else {
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    override func viewWillAppear(_ animated: Bool) { //2!! 인덱스가 정해져 있는데 characterImageView.image와 다른 값을 어떻게 UserDefaults에 다시 넣는지? characterImageView.image와 다른 값인걸 어떻게 구분하는지?
        print("viewWillAppear")
        
        /*
        if UserDefaults.standard.string(forKey: "characterName") == "따끔따끔 다마고치" {
        if feedingCalculatorArray[0] + feedingCalculatorArray[1] > 0 && feedingCalculatorArray[0] + feedingCalculatorArray[1] < 20 {
            characterImageView.image = UIImage(named: "1-1")
        } else if feedingCalculatorArray[0] + feedingCalculatorArray[1] >= 20 && feedingCalculatorArray[0] + feedingCalculatorArray[1] < 30 {
            characterImageView.image = UIImage(named: "1-2")
        } else if feedingCalculatorArray[0] + feedingCalculatorArray[1] >= 30 && feedingCalculatorArray[0] + feedingCalculatorArray[1] < 40 {
         */
        /*
        characterNameLabel.text = characterNameLabel.text == characterChange?.name ? "이름변경됨" : characterChange?.name
        
        //characterImageView.image == UIImage(named: characterChange!.image)
        
        if characterImageView.image == UIImage(named: "1-1") {
            characterImageView.image = UIImage(named: "2-1")
        } else if characterImageView.image == UIImage(named: "2-1") {
            characterImageView.image = UIImage(named: "3-1")
        } else if characterImageView.image == UIImage(named: "3-1") {
            characterImageView.image = UIImage(named: "1-1")
        } else {
    
        }
        */
        //print(UIImage(named: UserDefaults.standard.string(forKey: "characterImage")!))
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
        //var changedImage = UIImage(named: UserDefaults.standard.string(forKey: "characterImage")!)
        //characterImageView.image = UIImage(systemName: "star")
    }
    
}
