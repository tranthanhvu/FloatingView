//
//  PresentedViewController.swift
//  FloatingView
//
//  Created by Tran Thanh Vu on 5/24/20.
//  Copyright © 2020 Socspy. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {
    
    // define a variable to store initial touch position
    var initialTouchPoint: CGPoint = .zero
    var initialFrame: CGRect = .zero
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view.window)
        
        if sender.state == .began {
            initialTouchPoint = touchPoint
            initialFrame = self.view.frame
        } else if sender.state == .changed {
            let delta = touchPoint.y - initialTouchPoint.y
            var newFrame = initialFrame
            newFrame.origin.y += max(0, delta)
            self.view.frame = newFrame
            
        } else if sender.state == .ended || sender.state == .cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = self.initialFrame
                })
            }
        }
    }
}
