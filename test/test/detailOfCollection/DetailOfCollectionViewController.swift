//
//  DetailOfCollectionViewController.swift
//  test
//
//  Created by ryoku on 2018/07/16.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit

class DetailOfCollectionViewController: UIViewController {
    
    enum TransitState {
        case none
        case dismiss
    }
    
    private var transit: TransitState = .none
    
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var titleText: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.transit = .none
    }
    
    override func viewDidLoad() {
        self.titleLabel.text = titleText
        
        self.setNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if animated && transit == .dismiss {
            self.transitionFeedOutAnimation()
        }
        super.viewWillDisappear(animated)
    }
    
    func configure(title: String) {
        self.titleText = title
    }
    
    private func setNavigationBar() {
        let backEvent = #selector(self.goBack)
        self.backButton.action = backEvent
    }

    @objc private func goBack() {
        
        self.transit = .dismiss
        self.dismiss(animated: false, completion: nil)
    }
    
}
