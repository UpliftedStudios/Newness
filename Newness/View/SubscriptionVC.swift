//
//  SubscriptionVC.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/21/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//

import UIKit

class SubscriptionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func breakingBreadBtnTapped(_ sender: Any) {
    }
    
    @IBAction func spiritAndSongBtnTapped(_ sender: Any) {
        
        let navVC = MainVC()
        
        present(navVC, animated: true, completion: nil)
    }
}
