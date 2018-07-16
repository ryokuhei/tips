//
//  TableViewCell.swift
//  test
//
//  Created by ryoku on 2018/07/16.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var number: UILabel!
    
    func configure(number: Int) {
        self.number.text = String(number)
    }
}
