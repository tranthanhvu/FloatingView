//
//  ViewController.swift
//  FloatingView
//
//  Created by Tran Thanh Vu on 5/24/20.
//  Copyright © 2020 Socspy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - UI
    @IBOutlet var toggleButton: UISwitch!
    
    lazy var bottomPresentionDelegate: BottomPresentationDelegate = {
        return BottomPresentationDelegate(isPassingTouchEvent: toggleButton.isOn)
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Funcs
    @IBAction func toggleButtonPressed(_ sender: Any) {
//        toggleButton.setOn(!toggleButton.isOn, animated: true)
        bottomPresentionDelegate.isPassingTouchEvent = toggleButton.isOn
    }
    
    @IBAction func showTouchPassThroughPresentation(_ sender: Any) {
        if self.presentedViewController != nil {
            return
        }
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "PresentedViewController")
        vc.transitioningDelegate = bottomPresentionDelegate
        vc.modalPresentationStyle = .custom
        
        vc.view.layer.cornerRadius = 10
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func showCardPresentation(_ sender: Any) {
        if self.presentedViewController != nil {
            return
        }
        
        let presentation = CardPresentationProxy()
        let vc = storyboard!.instantiateViewController(withIdentifier: "PresentedViewController")
        vc.transitioningDelegate = presentation
        vc.modalPresentationStyle = .custom
        
        vc.view.layer.cornerRadius = 10
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func showNormalPresentation(_ sender: Any) {
        if self.presentedViewController != nil {
            return
        }
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "PresentedViewController")
        self.present(vc, animated: true, completion: nil)
    }
}

