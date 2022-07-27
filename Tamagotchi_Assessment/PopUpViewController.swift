//
//  PopUpViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import UIKit

class PopUpViewController: UIViewController {

    static var idenifier = "PopUpViewController"
    
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpImage: UIImageView!
    @IBOutlet weak var popUpName: UILabel!
    @IBOutlet weak var popUpLine: UIView!
    @IBOutlet weak var popUpIntroduction: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.5)
        
        popUpImage.image = UIImage(named: "1-1.jpg")
        
        popUpName.text = "캐릭터 이름"
        popUpName.fontAttribute()
        popUpName.layer.borderWidth = 1
        popUpName.layer.cornerRadius = 5
        
        
        popUpIntroduction.text = "캐릭터 소개"
        popUpIntroduction.fontAttribute()
        popUpIntroduction.textAlignment = .center
        popUpIntroduction.numberOfLines = 0
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.fontAttribute()
        
        startButton.fontAttribute()
        startButton.setTitle("시작하기", for: .normal)
        
            
    }
    
    @IBAction func moveToMainPage(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: MainViewController.idenifier) as! MainViewController
        
        let navi = UINavigationController(rootViewController: viewController)
        
        viewController.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(navi, animated: true)

    }
}
