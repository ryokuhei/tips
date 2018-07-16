//
//  CollectionviewController.swift
//  test
//
//  Created by ryoku on 2018/07/16.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    
    enum TransitState {
        case none
        case toDetailView
    }
    
    var transit: TransitState = .none

    let item = ["a", "b", "c", "d", "e"]
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.transit = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if animated && transit == .toDetailView {
            self.transitionFeedInAnimation()
        }
        super.viewWillDisappear(animated)
    }
    
    // itemnの数
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    // cellの設定
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell

        let title = item[indexPath.item]
        cell.configure(title: title)
        cell.backgroundColor = UIColor.gray

        return cell
    }
    
    
    // cellをタップ後のイベント
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let transitVC = UIStoryboard(name: "detailOfCollection", bundle: nil).instantiateInitialViewController() as! DetailOfCollectionViewController
        transitVC.configure(title: self.item[indexPath.item])
        
        self.transit = .toDetailView
        self.present(transitVC, animated: false, completion: nil)
        
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // cellのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let space: CGFloat = 5.0
        
        let size = collectionView.bounds.width / 3.0 - space
        return CGSize(width: size, height: size)
    }
    
    // cell間のマージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // cell間の横の幅
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }
    
    // cell間の縦の幅
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
