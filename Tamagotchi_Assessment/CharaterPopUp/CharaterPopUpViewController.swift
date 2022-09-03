//
//  CharaterPopUpViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

class CharaterPopUpViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpCharacterImageView: UIImageView!
    @IBOutlet weak var popUpCharacterNameLabel: UILabel!
    @IBOutlet weak var popUpDivisionLineView: UIView!
    @IBOutlet weak var popUpCharacterIntroduction: UILabel!
    @IBOutlet weak var popUpCancelButton: UIButton!
    @IBOutlet weak var popUpStartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func popUpStartButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CharacterDetailViewController") as! CharacterDetailViewController
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true)
    }
    
}
