//
//  SelectionCollectionViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectionCollectionViewController: UICollectionViewController {
    
    let characterData = CharacterData()
    let notificationCenter = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        navigationItem.title = "다마고치 선택하기"
        
        let layout = UICollectionViewFlowLayout()
        let spacing : CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        let itemSize = CGSize(width: width / 3, height: width / 3 + 30)
        layout.itemSize = itemSize
        layout.minimumLineSpacing = spacing / 2
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .backgroundColor
        
        requestAuthorization()
    }
    
    func requestAuthorization() { //노티 권한요청
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
            if success {
                self.sendNotification()
            }
        }
    }
    
    func sendNotification() { //노티 내용 작성
        //노티 메시지 작성
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "다마고치 한번 키워보실래예?"
        notificationContent.body = "물이랑 밥만 주면 알아서 자라는 다마고치랍니다."
        notificationContent.badge = 1
        
        //노티 발송 타이밍 설정
        
        var dateComponent = DateComponents()
        dateComponent.minute = 10
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //노티 누적여부+메시지+타이밍 묶어서 iOS알림센터에 요청
        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger)
        notificationCenter.add(request)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterData.characterGeneralData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectionCollectionViewCell.identifier, for: indexPath) as! SelectionCollectionViewCell
        
        let dataInfo = characterData.characterGeneralData[indexPath.row]
        cell.characterNameLabel.text = dataInfo.name
        if indexPath.item <= 2 { //!!item index에 따라 이미지설정
        cell.characterImageView.image = UIImage(named: "\(dataInfo.image)-6")
        } else {
            cell.characterImageView.image = UIImage(named: "noImage")
        }
        cell.configureCell()

        return cell
    }
 
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let data = characterData.characterGeneralData[indexPath.item] //!!
    
        UserDefaults.standard.set(data.image, forKey: "characterImage")
        UserDefaults.standard.set(data.name, forKey: "characterName")
        UserDefaults.standard.set(data.intro, forKey: "characterIntro")
        print(UserDefaults.standard.string(forKey: "characterImage"))

        if indexPath.item <= 2 {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CharaterPopUpViewController") as! CharaterPopUpViewController
            vc.modalPresentationStyle = .overFullScreen

        present(vc, animated: true)
        } else {
            return
        }
    }
}
