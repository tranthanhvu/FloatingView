//
//  ViewController.swift
//  FloatingView
//
//  Created by Tran Thanh Vu on 5/24/20.
//  Copyright © 2020 Socspy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bottomPresentionDelegate = BottomPresentationDelegate(isPassingTouchEvent: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showButtonPressed(_ sender: Any) {
        if let presented = self.presentedViewController {
            presented.removeFromParent()
        }
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "PresentedViewController")
        vc.transitioningDelegate = bottomPresentionDelegate
        vc.modalPresentationStyle = .custom
        
        vc.view.layer.cornerRadius = 10
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func passingTouchEventButtonPressed(_ sender: Any) {
        bottomPresentionDelegate.isPassingTouchEvent = !bottomPresentionDelegate.isPassingTouchEvent
    }
}

