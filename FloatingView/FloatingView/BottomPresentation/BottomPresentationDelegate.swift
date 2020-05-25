//
//  BottomPresentationDelegate.swift
//  FloatingView
//
//  Created by Yoyo on 5/25/20.
//  Copyright © 2020 Socspy. All rights reserved.
//

import UIKit

class BottomPresentationDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    var isPassingTouchEvent = false
    init(isPassingTouchEvent: Bool) {
        self.isPassingTouchEvent = isPassingTouchEvent
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = BottomPresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.isPassingTouchEvent = isPassingTouchEvent
        
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BottomPresentationAnimator(isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BottomPresentationAnimator(isPresentation: false)
    }
}
