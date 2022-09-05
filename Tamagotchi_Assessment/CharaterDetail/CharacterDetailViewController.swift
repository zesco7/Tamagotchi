//
//  CharacterDetailViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

/*질문
 -. extension 연결이 잘안되는 이유? -> 재연결하면 되긴함...
 -. buttonTitle font size extension 적용안되는 이유?
 -. UITapGestureRecognizer 왜 작동안하는지? -> UITapGestureRecognizer안돼서 touchesBegan으로 처리함
 -. 밥,물버튼눌러서 텍스트필드에 값이 있을 때 텍스트필드값을 키보드로 입력했을때 값이 제대로 변경되게 하는법?
 -. 키보드타입 numberpad로 하면 키보드에 리턴버튼이 없는데 리턴값은 어떻게 전달하는지?
 -. 1!!Selection화면에서 저장된 캐릭터이름 값을 UserDefaults에 저장하여 조건문판단에 사용하는데 왜 조건적용이 안되는지?, 구조체로 값을 꺼내려고하면 셀재사용이 안되서 indexpath가 적용이 안되는데 값을 어떻게 꺼내오는지?
 */

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var characterResponseImageView: UIImageView!
    @IBOutlet weak var characterResponseLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterLevelLabel: UILabel!
    @IBOutlet weak var riceValue: UILabel!
    @IBOutlet weak var waterValue: UILabel!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var riceAddButton: UIButton!
    @IBOutlet weak var waterAddButton: UIButton!
    
    var characterResponseArray = ["복습안했으면 빨리하세요. 복습해야 실력이 늘어요.", "만나서 반갑습니다.", "주말 잘보내세요."]
    var feedingCalculatorArray = [0, 0]
    var feedingCalculatorTypedArray = [0, 0]
    var levelValue = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageData = CharacterImageData()
        print(UserDefaults.standard.string(forKey: "characterName")!)
        
        /*//1!!Selection화면에서 저장된 캐릭터이름 값을 UserDefaults에 저장하여 조건문판단에 사용하는데 왜 조건적용이 안되는지?, 구조체로 값을 꺼내려고하면 셀재사용이 안되서 indexpath가 적용이 안되는데 값을 어떻게 꺼내오는지?
        if characterNameLabel.text == UserDefaults.standard.string(forKey: "characterName") {
            if levelValue == 1 {
                characterImageView.image = UIImage(named: "1-1")
            } else if levelValue == 2 {
                characterImageView.image = UIImage(named: "1-2")
            } else if levelValue == 3 {
                characterImageView.image = UIImage(named: "1-3")
            } else if levelValue == 4 {
                characterImageView.image = UIImage(named: "1-4")
            }
        }
         */
        
        //var characterLevel = (UserDefaults.standard.integer(forKey: "riceCount") / 5) + (UserDefaults.standard.integer(forKey: "waterCount") / 2)
        
        view.backgroundColor = .backgroundColor
        
        navigationItemAttribute(nickname: "\(UserDefaults.standard.string(forKey: "rename")!)")
        characterImageView.image = UIImage(named: UserDefaults.standard.string(forKey: "characterImage") ?? "star.fill") //!!
        
        //characterLevelLabel.text = "밥알 \(UserDefaults.standard.integer(forKey: "riceCount")) 개 물방울 \(UserDefaults.standard.integer(forKey: "waterCount"))개"
        //characterLevelLabel.text = "\(characterLevel)"
        characterNameLabelAttribute()
        
        //characterLevelLabelAttribute()
        
        characterLevelLabel.labelFontAttribute()
        riceValue.labelFontAttribute()
        waterValue.labelFontAttribute()
        //characterLevelLabelAttribute(riceValue: UserDefaults.standard.integer(forKey: "riceCount"))
        feedingObjectsAttribute(textFieldName: riceTextField, buttonName: riceAddButton, placeholder: "밥주세용", buttonTitle: " 밥먹기", buttonImage: "drop.circle")
        feedingObjectsAttribute(textFieldName: waterTextField, buttonName: waterAddButton, placeholder: "물주세용", buttonTitle: " 물먹기", buttonImage: "leaf.circle")
        
        print(feedingCalculatorArray)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        characterResponseImageView.image = UIImage(named: "bubble")
        var characterResponseArray = ["복습안했으면 빨리하세요. 복습해야 실력이 늘어요.", "만나서 반갑습니다.", "주말 잘보내세요."]
        characterResponseLabel.text = "\(characterResponseArray[Int.random(in: 0...characterResponseArray.count - 1)]) \(UserDefaults.standard.string(forKey: "rename")!)님."
        characterResponseLabel.labelFontAttribute()
        characterResponseLabel.numberOfLines = 0
    }

    func navigationItemAttribute(nickname: String) {
        navigationItem.title = "\(nickname)님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        }
    
    @objc
    func rightBarButtonItemClicked() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func characterNameLabelAttribute() {
        characterNameLabel.text = UserDefaults.standard.string(forKey: "characterName")
        characterNameLabel.labelFontAttribute()
        characterNameLabel.labelBorderAttribute()
    }
    
    
    func characterLevelLabelAttribute() {
        riceValue.text = "밥알 0 개"
        characterLevelLabel.text = "\(feedingCalculatorArray[0])"
        UserDefaults.standard.removeObject(forKey: "riceCount")
    }
    
//    func characterLevelLabelAttribute(level: Int, riceValue: Int, waterValue: Int) {
//        characterLevelLabel.text = "LV\(level), 밥알 \(riceValue)개, 물방울 \(waterValue)개"
//        characterLevelLabel.labelFontAttribute()
//    }
    
    func feedingObjectsAttribute(textFieldName: UITextField, buttonName: UIButton, placeholder: String, buttonTitle: String, buttonImage: String) {
        textFieldName.placeholder = placeholder
        textFieldName.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textFieldName.frame.size.height-1, width: textFieldName.frame.width, height: 1)
        border.backgroundColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        textFieldName.layer.addSublayer((border))
        textFieldName.textAlignment = .center
        textFieldName.keyboardType = .numberPad
        textFieldName.textFieldFontAttribute()

        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setImage(UIImage(systemName: buttonImage), for: .normal)
        buttonName.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        buttonName.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        buttonName.buttonFontAttribute()
        buttonName.buttonBorderAttribute()
    }
    
    //2!!버튼을 몇차례 누르고 텍스트필드에 값이 있는 상태에서 텍스트필드에 직접입력하는 경우 직접입력한 값을  UserDefaults에 따로 저장해야하나?
    @IBAction func riceAddButtonClicked(_ sender: UIButton) {
        feedingCalculatorArray[sender.tag] += 1
        riceValue.text = "밥알 \(feedingCalculatorArray[sender.tag]) 개"
        
        UserDefaults.standard.set(feedingCalculatorArray[sender.tag], forKey: "riceCount")

        print(feedingCalculatorArray)
        print(UserDefaults.standard.integer(forKey: "riceCount"))
    }
    
    @IBAction func waterAddButtonClicked(_ sender: UIButton) {
        feedingCalculatorArray[sender.tag] += 1
        waterValue.text = "\(feedingCalculatorArray[sender.tag])"
        
        UserDefaults.standard.set(feedingCalculatorArray[sender.tag], forKey: "waterCount")
        print(feedingCalculatorArray)
    }
    
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func returnInputRice(_ sender: UITextField) {
        let value = Int(riceTextField.text!) ?? 0
        riceTextField.text = "밥알 \(value) 개"
        view.endEditing(true)
    }
    @IBAction func returnInputWater(_ sender: UITextField) {
        let value = Int(waterTextField.text!) ?? 0
        waterTextField.text = "물방울 \(sender) 개"
        view.endEditing(true)
    }
    
}
