//
//  PresentationController.swift
//  Fundya
//
//  Created by Pramod Yadav on 09/02/21.
//  Copyright © 2021 Iverve. All rights reserved.
//

import Foundation
import UIKit

class PresentationController: UIPresentationController {
    
    let viewTransparent: UIView!
    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
    var VC = UIViewController()
    var viewHeight: CGFloat = 0.0
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        VC = presentedViewController
        let viewTemp = UIView()
        viewTransparent = viewTemp
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        viewTemp.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        viewTransparent.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewTransparent.isUserInteractionEnabled = true
        viewTransparent.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
            return CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height * 0.4),
                          size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height *
                                        0.6))
    }
    
    override func presentationTransitionWillBegin() {
        self.viewTransparent.alpha = 0
        self.containerView?.addSubview(viewTransparent)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.viewTransparent.alpha = 0.4
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in })
    }
    
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.viewTransparent.alpha = 0
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in
            self.viewTransparent.removeFromSuperview()
        })
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
//            presentedView!.roundCorners([.topLeft, .topRight], radius: 0)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        viewTransparent.frame = containerView!.bounds
    }
    
    @objc func dismissController(){
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}

extension PresentationController {
    private struct NewHeight {
        static var myViewHeight: CGFloat!
    }
    
    var _viewHeight: CGFloat {
        get {
            return NewHeight.myViewHeight ?? 0.0
        } set {
            return NewHeight.myViewHeight = newValue
        }
    }
}
