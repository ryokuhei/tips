//
//  Extension.swift
//  test
//
//  Created by ryoku on 2018/07/16.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    

    func transitionFeedInAnimation() {
        
        self.view.window?.layer.removeAllAnimations()

        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromRight
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
    }
    
    func transitionFeedOutAnimation() {
        
        self.view.window?.layer.removeAllAnimations()
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
    }

}

