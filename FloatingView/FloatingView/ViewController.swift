//
//  ViewController.swift
//  FloatingView
//
//  Created by Tran Thanh Vu on 5/24/20.
//  Copyright © 2020 Socspy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var slideInPresentionDelegate = SlideInPresentationDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "ToPresentedVCSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPresentedVCSegue" {
            let controller = segue.destination
            controller.transitioningDelegate = slideInPresentionDelegate
            controller.modalPresentationStyle = .custom
        }
    }
}

