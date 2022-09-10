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
class RenameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var renameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "rename") ?? "대장")님 이름 정하기" //found nil while unwrapping 개선: nil-coalescing사용
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        view.backgroundColor = .backgroundColor
        
        renameTextFieldAttribute()
        renameTextField.text = UserDefaults.standard.string(forKey: "rename")
        renameTextField.delegate = self
        
    }
    
    @objc
    func rightBarButtonItemClicked() {
        UserDefaults.standard.set(renameTextField.text, forKey: "rename")
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "rename")!)님 이름 정하기"
        
        let alert = UIAlertController(title: "저장완료", message: "이름이 변경되었습니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { (action) in
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func renameTextFieldAttribute() {
        renameTextField.borderStyle = .none
        renameTextField.placeholder = "이름을 입력해주세요!"
        let border = CALayer()
        border.frame = CGRect(x: 0, y: renameTextField.frame.size.height-1, width: renameTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        renameTextField.layer.addSublayer((border))
        renameTextField.textFieldFontAttribute()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = textField.text else {return false}
            
            // 최대 글자수 이상을 입력한 이후에는 중간에 다른 글자를 추가할 수 없게끔 작동
            if text.count >= 6 && range.length == 0 && range.location < 7 {
                return false
            }
            
            return true
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
