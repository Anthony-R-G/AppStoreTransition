//
//  CustomTransitionAnimation.swift
//  AppStoreTransitionProgrammatic
//
//  Created by Anthony Gonzalez on 8/15/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

class CustomTransitionAnimation: NSObject {
    fileprivate let operationType: UINavigationController.Operation
    fileprivate let positioningDuration: TimeInterval
    fileprivate let resizingDuration: TimeInterval
    
    init(
        operation: UINavigationController.Operation,
        positioningDuration: TimeInterval,
        resizingDuration: TimeInterval
    ) {
        self.operationType = operation
        self.positioningDuration = positioningDuration
        self.resizingDuration = resizingDuration
    }
}

extension CustomTransitionAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return max(self.resizingDuration, self.positioningDuration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if self.operationType == .push {
            self.presentTransition(transitionContext)
        } else if self.operationType == .pop {
            self.dismissTransition(transitionContext)
        }
    }
}

extension CustomTransitionAnimation {
    // Custom push animations
    internal func presentTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    // Custom pop animations
    internal func dismissTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
