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
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let duration = transitionDuration(transitionContext)
        let initialFrame = imageView.frame
        let finalFrame = transitionContext.finalFrameForViewController(toViewController!)

        transitionContext.containerView().addSubview(toViewController!.view)
        
        toViewController!.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.imageView.frame = finalFrame
        }) { (completed) -> Void in
            toViewController!.view.alpha = 1
            self.imageView.frame = initialFrame
            transitionContext.completeTransition(true)
        }
    
    }
    
    func animateHideTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let duration = transitionDuration(transitionContext)
        transitionContext.containerView().addSubview(toViewController!.view)
        toViewController!.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            toViewController!.view.alpha = 1
        }) { (completed) -> Void in
            transitionContext.completeTransition(true)
        }
    }
   
}
