//
//  SelectionCollectionViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/09/03.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectionCollectionViewController: UICollectionViewController {
    
    var characterNameArray = ["따끔따끔 다마고치", "방실방실 다마고치", "반짝반짝 다마고치", "준비중이에요"]
    var characterImageArray = ["1-6", "2-6", "3-6", "noImage"]

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
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectionCollectionViewCell.identifier, for: indexPath) as! SelectionCollectionViewCell
        
        if indexPath.item == 0 {
        cell.characterNameLabel.text = characterNameArray[0]
        } else if indexPath.item == 1 {
            cell.characterNameLabel.text = characterNameArray[1]
        } else if indexPath.item == 2 {
            cell.characterNameLabel.text = characterNameArray[2]
        } else {
            cell.characterNameLabel.text = characterNameArray[3]
        }
        
        if indexPath.item == 0 {
            cell.characterImageView.image = UIImage(named: characterImageArray[0])
        } else if indexPath.item == 1 {
            cell.characterImageView.image = UIImage(named: characterImageArray[1])
        } else if indexPath.item == 2 {
            cell.characterImageView.image = UIImage(named: characterImageArray[2])
        } else {
            cell.characterImageView.image = UIImage(named: characterImageArray[3])
        }
        
        cell.configureCell()

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CharaterPopUpViewController") as! CharaterPopUpViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
