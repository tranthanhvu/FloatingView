//
//  BottomPresentationController.swift
//  FloatingView
//
//  Created by Yoyo on 5/25/20.
//  Copyright © 2020 Socspy. All rights reserved.
//

import UIKit

class BottomPresentationController: UIPresentationController {
    
    var isPassingTouchEvent = false
    var height: CGFloat = 0
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        height = (containerView?.frame.height ?? 0) * 0.6
        
        if let presentedView = presentedView {
            presentedView.layer.shadowColor = UIColor.gray.cgColor
            presentedView.layer.shadowOffset = CGSize(width: 1, height: -3)
            presentedView.layer.shadowOpacity = 1
            presentedView.layer.shadowRadius = 4
        }
        
        if isPassingTouchEvent {
            containerView?.frame = frameOfPresentedViewInContainerView
        }
    }

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }

    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        print("\(isPassingTouchEvent) \(parentSize)")
        return CGSize(width: parentSize.width , height: height)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)
        frame.origin.y = containerView!.frame.height - height
        return frame
    }
}
