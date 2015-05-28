//
//  ArticleImageAnimator.swift
//  NYTimes
//
//  Created by Rahul Katariya on 28/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

import UIKit

class ArticleImageAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    weak var imageView: UIImageView!
    
    init(imageView: UIImageView!) {
        self.imageView = imageView
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let viewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        if let vc = viewController {
            if vc.isBeingPresented() {
                animateShowTranistion(transitionContext)
            } else {
                animateHideTransition(transitionContext)
            }
        }
    }
    
    func animateShowTranistion(transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    func animateHideTransition(transitionContext: UIViewControllerContextTransitioning) {
    
    }
   
}
