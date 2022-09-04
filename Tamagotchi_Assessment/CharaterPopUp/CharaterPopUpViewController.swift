//
//  CharaterPopUpViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

/*질문
 -. 팝업뷰 뜰 때 투명배경색 적용?
 -. 취소버튼 cornerRadius 적용안되는 이유?
 -. 취소, 시작하기 버튼 위 구분선 적용하는 방법?
 -. SelectionCollectionViewController에서 선택한 캐릭터 정보를 어떻게 가져와서 화면에 표시하는지? sender.tag?
 -. popUpCancelButtonClicked 액션실행하면 이전화면이 아니라 첫화면으로 전환하도록 해야하지 않을까?
 */

class CharaterPopUpViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpCharacterImageView: UIImageView!
    @IBOutlet weak var popUpCharacterNameLabel: UILabel!
    @IBOutlet weak var popUpDivisionLineView: UIView!
    @IBOutlet weak var popUpCharacterIntroduction: UILabel!
    @IBOutlet weak var popUpCancelButton: UIButton!
    @IBOutlet weak var popUpStartButton: UIButton!
    
    let characterData = CharacterData()
    
    var characterIntro = ["저는 따끔따끔 다마고치입니다. 저를 키워보시겠어요? 물만 주면 알아서 잘크는 아이랍니다. 호호.", "저는 방실방실 다마고치입니다. 저를 키워보시겠어요? 밥만 주면 알아서 잘크는 아이랍니다. 호호.", "저는 반짝반짝 다마고치입니다. 저는 물도 밥도 필요없어요. 그저 선택만해주세요..."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(white: 0.3, alpha: 0.3)
        popUpView.layer.cornerRadius = 10
        popUpView.backgroundColor = .backgroundColor
        
        popUpDivisionLineView.backgroundColor = .systemGray3
        
        popUpCharacterIntroductionAttribute()
        
        popUpCharacterImageView.image = UIImage(named: UserDefaults.standard.string(forKey: "characterImage") ?? "star.fill") //!!
        popUpCharacterNameLabelAttribute()
        
        popUpButtonAttribute()
        print("1")
    }
    
    func popUpCharacterIntroductionAttribute() {
        popUpCharacterIntroduction.text = characterIntro[0]
        popUpCharacterIntroduction.numberOfLines = 0
        popUpCharacterIntroduction.labelFontAttribute()
    }
    
    func popUpCharacterNameLabelAttribute() {
        popUpCharacterNameLabel.text = UserDefaults.standard.string(forKey: "characterName")
        popUpCharacterNameLabel.textAlignment = .center
        popUpCharacterNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        popUpCharacterNameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        popUpCharacterNameLabel.labelBorderAttribute()
    }
    
    func popUpButtonAttribute() {
        popUpCancelButton.setTitle("취소", for: .normal)
        popUpCancelButton.backgroundColor = .systemGray3
        popUpCancelButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        popUpStartButton.setTitle("시작하기", for: .normal)
        popUpStartButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        
        
    }
    
    //
    @IBAction func popUpCancelButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SelectionCollectionViewController") as! SelectionCollectionViewController
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true)
    }
    
    @IBAction func popUpStartButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CharacterDetailViewController") as! CharacterDetailViewController
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true)
    }
    
}
