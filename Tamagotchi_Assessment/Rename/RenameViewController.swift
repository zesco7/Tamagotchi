//
//  RenameViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

/*질문
 -. 왜 UserDefaults.standard.string(forKey: "rename")이 옵셔널인지?
 
 */
class RenameViewController: UIViewController {

    @IBOutlet weak var renameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "rename")!)님 이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        view.backgroundColor = .backgroundColor
        
        renameTextFieldAttribute()
        
        renameTextField.text = UserDefaults.standard.string(forKey: "rename")
    }
    
    @objc //이름저장 추가위치
    func rightBarButtonItemClicked() {
        UserDefaults.standard.set(renameTextField.text, forKey: "rename")
        
        //CharacterDetailViewController: 네비타이틀, 말풍선
        //SettingTableViewController: 내이름 설정하기
    }
    
    func renameTextFieldAttribute() {
        renameTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: renameTextField.frame.size.height-1, width: renameTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        renameTextField.layer.addSublayer((border))
        renameTextField.textFieldFontAttribute()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
