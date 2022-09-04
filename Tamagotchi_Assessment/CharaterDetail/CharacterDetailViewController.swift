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
 
 */

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var characterResponseImageView: UIImageView!
    @IBOutlet weak var characterResponseLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterLevelLabel: UILabel!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var riceAddButton: UIButton!
    @IBOutlet weak var waterAddButton: UIButton!
    
    var feedingCalculatorArray = [0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
        
        characterImageView.image = UIImage(named: "1-6")
        
        navigationItemAttribute(nickname: "대장")
        characterResponseAttribute()
        characterNameLabelAttribute()
        characterLevelLabelAttribute()
        feedingObjectsAttribute(textFieldName: riceTextField, buttonName: riceAddButton, placeholder: "밥주세용", buttonTitle: " 밥먹기", buttonImage: "drop.circle")
        feedingObjectsAttribute(textFieldName: waterTextField, buttonName: waterAddButton, placeholder: "물주세용", buttonTitle: " 물먹기", buttonImage: "leaf.circle")
        
        print(feedingCalculatorArray)
    
    }
    
    func navigationItemAttribute(nickname: String) {
        navigationItem.title = "\(nickname)님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        }
    
    @objc
    func rightBarButtonItemClicked() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func characterResponseAttribute() {
        characterResponseImageView.image = UIImage(named: "bubble")
        characterResponseLabel.text = "복습안했으면 빨리하세요. 복습해야 실력이 늘어요."
        characterResponseLabel.labelFontAttribute()
        characterResponseLabel.numberOfLines = 0
    }
    
    func characterNameLabelAttribute() {
        characterNameLabel.text = "방실방실 다마고치"
        characterNameLabel.labelFontAttribute()
        characterNameLabel.labelBorderAttribute()
    }
    
    func characterLevelLabelAttribute() {
        characterLevelLabel.text = "LV1, 밥알 n개, 물방울 n개"
        characterLevelLabel.labelFontAttribute()
    }
    
    func feedingObjectsAttribute(textFieldName: UITextField, buttonName: UIButton, placeholder: String, buttonTitle: String, buttonImage: String) {
        textFieldName.placeholder = placeholder
        textFieldName.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textFieldName.frame.size.height-1, width: textFieldName.frame.width, height: 1)
        border.backgroundColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        textFieldName.layer.addSublayer((border))
        textFieldName.textAlignment = .center
        //textFieldName.keyboardType = .numberPad
        textFieldName.textFieldFontAttribute()

        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setImage(UIImage(systemName: buttonImage), for: .normal)
        buttonName.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        buttonName.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        buttonName.buttonFontAttribute()
        buttonName.buttonBorderAttribute()
    }
    
    @IBAction func riceAddButtonClicked(_ sender: UIButton) {
        feedingCalculatorArray[sender.tag] += 1
        riceTextField.text = "밥알 \(feedingCalculatorArray[sender.tag]) 개"
        print(feedingCalculatorArray)
    }
    
    @IBAction func waterAddButtonClicked(_ sender: UIButton) {
        feedingCalculatorArray[sender.tag] += 1
        waterTextField.text = "물방울 \(feedingCalculatorArray[sender.tag]) 개"
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
