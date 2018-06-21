//
//  CustomButton.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/21/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//

import Foundation
import UIKit

class CustomBtn: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 50.0
        self.clipsToBounds = true
    }
}
