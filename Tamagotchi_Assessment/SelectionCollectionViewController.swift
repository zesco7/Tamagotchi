//
//  SelectionCollectionViewController.swift
//  Tamagotchi_Assessment
//
//  Created by Mac Pro 15 on 2022/07/27.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectionCollectionViewController: UICollectionViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColorForCvc()
        
        
        navigationItem.title = "다마고치 선택하기"

        //UI프레임 셋팅
        let layout = UICollectionViewFlowLayout()
        let spacing : CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.1)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectionCollectionViewCell.identifier, for: indexPath) as! SelectionCollectionViewCell
        
        //캐릭터 미리보기 속성
        
        let thumbnail = UIImage(named: "1-1.jpg")
                
        cell.selectionImage.image = thumbnail
        cell.selectionLabel.text = "이름"
    
        cell.selectionLabel.font = .systemFont(ofSize: 13)
        cell.selectionLabel.textAlignment = .center
        cell.selectionLabel.layer.borderColor = UIColor.gray.cgColor
        cell.selectionLabel.layer.borderWidth = 1
        cell.selectionLabel.layer.cornerRadius = 5
        
        
        
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//               cell.imgView?.image = img
//               cell.nameLabel?.text = nameList[indexPath.row]
        
        
        // Configure the cell
        
    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: PopUpViewController.idenifier) as! PopUpViewController

        self.navigationController?.present(viewController, animated: true)        
    }
    

}
