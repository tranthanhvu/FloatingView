//
//  TPTPresentationProxy.swift
//  FloatingView
//
//  Created by Yoyo on 12/31/20.
//  Copyright © 2020 Socspy. All rights reserved.
//

import UIKit

class TPTPresentationProxy: NSObject, UIViewControllerTransitioningDelegate {
    
    var isPassingTouchEvent = false
    init(isPassingTouchEvent: Bool) {
        self.isPassingTouchEvent = isPassingTouchEvent
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = TPTPresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.isPassingTouchEvent = isPassingTouchEvent
        
        return presentationController
    }
}
