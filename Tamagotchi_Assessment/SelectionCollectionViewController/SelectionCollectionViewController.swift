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
