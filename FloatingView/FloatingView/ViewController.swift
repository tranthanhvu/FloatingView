//
//  ViewController.swift
//  FloatingView
//
//  Created by Tran Thanh Vu on 5/24/20.
//  Copyright © 2020 Socspy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var toggleButton: UISwitch! {
        didSet {
            bottomPresentionDelegate.isPassingTouchEvent = toggleButton.isOn
        }
    }
    
    lazy var bottomPresentionDelegate: BottomPresentationDelegate = {
        return BottomPresentationDelegate(isPassingTouchEvent: toggleButton.isOn)
    }()
    
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
    
    @IBAction func showCardView(_ sender: Any) {
        if let presented = self.presentedViewController {
            presented.removeFromParent()
        }
        
        let presentation = CardPresentationProxy()
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "PresentedViewController")
        vc.transitioningDelegate = presentation
        vc.modalPresentationStyle = .custom
        
        vc.view.layer.cornerRadius = 10
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        toggleButton.isOn = !toggleButton.isOn
    }
}

