//
//  ProfilimageVc.swift
//  RealPass
//
//  Created by patel chandan on 08/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit

class ProfilimageVc: UIViewController {
    
    var img:UIImage!
    
    var strUrl:String = ""
    var mybool:Bool!

    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var myimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.btnClose.layer.cornerRadius = 23
        myimage.sd_setImage(with: URL(string: strUrl ?? ""), placeholderImage: UIImage(named: "user" ?? ""))
    }
    @IBAction func closebtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.mybool = false
    }
    
}
