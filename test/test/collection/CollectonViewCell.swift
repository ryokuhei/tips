//
//  CollectonViewCell.swift
//  test
//
//  Created by ryoku on 2018/07/16.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    func configure(title: String) {
        self.title.text = title
    }
}
