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
    var characterChange: CharacterInformation?
    var characterString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        
        characterInformationRefresh()
        
        characterNameLabelAttribute()
        characterLevelLabel.labelFontAttribute()
        
        riceValue.labelFontAttribute()
        waterValue.labelFontAttribute()
        feedingObjectsAttribute(textFieldName: riceTextField, buttonName: riceAddButton, placeholder: "밥주세용", buttonTitle: " 밥먹기", buttonImage: "drop.circle")
        feedingObjectsAttribute(textFieldName: waterTextField, buttonName: waterAddButton, placeholder: "물주세용", buttonTitle: " 물먹기", buttonImage: "leaf.circle")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        //optional binding 대신 nil-coalescing 사용하여 이름설정안했을때 이름 표시
        navigationItemAttribute(nickname: "\(UserDefaults.standard.string(forKey: "rename") ?? "대장")")
        characterResponseImageView.image = UIImage(named: "bubble")
        var characterResponseArray = ["복습안했으면 빨리하세요. 복습해야 실력이 늘어요.", "만나서 반갑습니다.", "주말 잘보내세요."]
        characterResponseLabel.text = "\(characterResponseArray[Int.random(in: 0...characterResponseArray.count - 1)]) \(UserDefaults.standard.string(forKey: "rename") ?? "대장")님."
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
    func rightBarButtonItemClicked() { //CharacterDetailViewController에 네비게이션컨트롤러 연결했기 때문에 화면전환 스타일을 present로 변경하지 않는한 SettingTableViewController에는 네비게이션 컨트롤러 연결하지 않아도 됨.
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func characterNameLabelAttribute() {
        characterNameLabel.text = UserDefaults.standard.string(forKey: "characterName")
        characterNameLabel.labelFontAttribute()
        characterNameLabel.labelBorderAttribute()
    }
    
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
    
    func characterInformationRefresh() {
        let levelResult = (UserDefaults.standard.integer(forKey: "totalRiceCount") / 5) + (UserDefaults.standard.integer(forKey: "totalWaterCount") / 2)
        characterLevelLabel.text = "LV\(levelResult)"
        riceValue.text = "밥알 \(UserDefaults.standard.integer(forKey: "totalRiceCount"))개"
        waterValue.text = "물방울 \(UserDefaults.standard.integer(forKey: "totalWaterCount"))개"
        
        let characterType = UserDefaults.standard.string(forKey: "characterImage")!
        characterImageView.image = UIImage(named: "\(characterType)-1")
        
        if levelResult >= 0 && levelResult < 20 {
            characterLevelLabel.text = "LV1"
            characterImageView.image = UIImage(named: "\(characterType)-1")
        } else if levelResult >= 20 && levelResult < 30 {
            characterLevelLabel.text = "LV2"
            characterImageView.image = UIImage(named: "\(characterType)-2")
        } else if levelResult >= 30 && levelResult < 40 {
            characterLevelLabel.text = "LV3"
            characterImageView.image = UIImage(named: "\(characterType)-3")
        } else if levelResult >= 40 && levelResult < 50 {
            characterLevelLabel.text = "LV4"
            characterImageView.image = UIImage(named: "\(characterType)-4")
        } else if levelResult >= 50 && levelResult < 60 {
            characterLevelLabel.text = "LV5"
            characterImageView.image = UIImage(named: "\(characterType)-5")
        } else if levelResult >= 60 && levelResult < 70 {
            characterLevelLabel.text = "LV6"
            characterImageView.image = UIImage(named: "\(characterType)-6")
        } else if levelResult >= 70 && levelResult < 80 {
            characterLevelLabel.text = "LV7"
            characterImageView.image = UIImage(named: "\(characterType)-7")
        } else if levelResult >= 80 && levelResult < 90 {
            characterLevelLabel.text = "LV8"
            characterImageView.image = UIImage(named: "\(characterType)-8")
        } else if levelResult >= 90 && levelResult < 100 {
            characterLevelLabel.text = "LV9"
            characterImageView.image = UIImage(named: "\(characterType)-8")
        } else if levelResult >= 100 {
            characterLevelLabel.text = "LV10"
            characterImageView.image = UIImage(named: "\(characterType)-9")
        } else {
            
        }
    }
    
    //2!!버튼을 몇차례 누르고 텍스트필드에 값이 있는 상태에서 텍스트필드에 직접입력하는 경우 직접입력한 값을  UserDefaults에 따로 저장해야하나?
    @IBAction func riceAddButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.integer(forKey: "totalRiceCount") //처음 가져올 데이터: 버튼누르기전 밥갯수 0개
        UserDefaults.standard.set(riceTextField.text, forKey: "riceCount") //저장할 데이터: 텍스트필드 입력값
        
        if riceTextField.text != "" && Int(riceTextField.text!) != nil && Int(riceTextField.text!)! < 100 { //텍스트필드 조건(빈칸, 숫자, 범위)
            let totalRiceCount = UserDefaults.standard.integer(forKey: "totalRiceCount") + UserDefaults.standard.integer(forKey: "riceCount")
            UserDefaults.standard.set(totalRiceCount, forKey: "totalRiceCount")
            print(UserDefaults.standard.integer(forKey: "totalRiceCount"))
        }
        else {
            let totalRiceCount = UserDefaults.standard.integer(forKey: "totalRiceCount") + 1
            UserDefaults.standard.set(totalRiceCount, forKey: "totalRiceCount")
        }
        
        riceValue.text = "밥알 \(UserDefaults.standard.integer(forKey: "totalRiceCount")) 개"
        let levelResultForRice = (UserDefaults.standard.integer(forKey: "totalRiceCount") / 5) + (UserDefaults.standard.integer(forKey: "totalWaterCount") / 2)
        characterLevelLabel.text = "LV \(levelResultForRice)"
        print("level:", levelResultForRice)
        characterInformationRefresh()
    }
    
    @IBAction func waterAddButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.integer(forKey: "totalWaterCount") //처음 가져올 데이터: 버튼누르기전 밥갯수 0개
        UserDefaults.standard.set(waterTextField.text, forKey: "waterCount") //저장할 데이터: 텍스트필드 입력값
        
        if waterTextField.text != "" && Int(waterTextField.text!) != nil && Int(waterTextField.text!)! < 50 { //텍스트필드 조건(빈칸, 숫자, 범위)
            let totalWaterCount = UserDefaults.standard.integer(forKey: "totalWaterCount") + UserDefaults.standard.integer(forKey: "waterCount")
            UserDefaults.standard.set(totalWaterCount, forKey: "totalWaterCount")
            print(UserDefaults.standard.integer(forKey: "totalWaterCount"))
        }
        else {
            let totalWaterCount = UserDefaults.standard.integer(forKey: "totalWaterCount") + 1
            UserDefaults.standard.set(totalWaterCount, forKey: "totalWaterCount")
        }

        waterValue.text = "물방울 \(UserDefaults.standard.integer(forKey: "totalWaterCount")) 개"
        let levelResultForWater = (UserDefaults.standard.integer(forKey: "totalRiceCount") / 5) + (UserDefaults.standard.integer(forKey: "totalWaterCount") / 2)
        characterLevelLabel.text = "LV \(levelResultForWater)"
        print("level:", levelResultForWater)
        characterInformationRefresh()
    }
    
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func returnInputRice(_ sender: UITextField) {
        //let value = Int(riceTextField.text!) ?? 0
        //riceTextField.text = "밥알 \(value) 개"
        view.endEditing(true)
    }
    @IBAction func returnInputWater(_ sender: UITextField) {
        //let value = Int(waterTextField.text!) ?? 0
        //waterTextField.text = "물방울 \(sender) 개"
        view.endEditing(true)
    }
    
}

