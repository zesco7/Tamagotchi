//
//  RenameViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

class RenameViewController: UIViewController {

    @IBOutlet weak var renameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "대장님 이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(rightBarButtonItemClicked))

    }
    
    @objc //이름저장 추가위치
    func rightBarButtonItemClicked() {
        //CharacterDetailViewController: 네비타이틀, 말풍선
        //SettingTableViewController: 내이름 설정하기
    }
}
