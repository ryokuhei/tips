//
//  DetailOfTable.swift
//  test
//
//  Created by ryoku on 2018/07/16.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit

class DetailOfTableViewController: UIViewController {
    
    enum TransitState {
        case none
        case dismiss
    }
    
    var transit: TransitState = .none

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    private var numberText: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.transit = .none
    }
    
    override func viewDidLoad() {
        self.numberLabel.text = numberText
        
        self.setNaviationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if animated && transit == .dismiss {
            self.transitionFeedOutAnimation()
        }
        super.viewWillDisappear(animated)
    }

    func setNaviationBar() {
        
        let backEvent = #selector(self.goBack)
        self.backButton.action = backEvent
    }
    
    func configure(number: Int) {
        self.numberText = String(number)
    }
    
    @objc private func goBack() {

        self.transit = .dismiss
        self.dismiss(animated: false, completion: nil)
    }

}

