//
//  NextStepProfileSetup.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 01/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import Foundation
import UIKit

class NextStepProfileSetup: UIView{
    // MARK: Outlets
    @IBOutlet var pageControlerContentView: UIView!
    @IBOutlet var pageControle: UIPageControl!
    @IBOutlet var btnSaveNext: UIButton!
    // MARK:Propereties
    var buttonAction : (() -> Void)?
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        comonIint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        comonIint()
    }
    
    func comonIint(){
        Bundle.main.loadNibNamed("NextStepProfileSetup", owner: self, options: nil)
        addSubview(pageControlerContentView)
        pageControlerContentView.frame = self.bounds
        pageControlerContentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        btnSaveNext.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//        self.pageControle.pageIndicatorImage = UIImage(named: "pageInd")
//        self.pageControle.currentPageIndicatorImage = UIImage(named: "Menu Swipe")
        
    }
    
    @objc func buttonTapped(_ sender : UIButton){
        if let buttonAction = self.buttonAction{
            buttonAction()
        }
    }
    
    
}
