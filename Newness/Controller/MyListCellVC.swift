//
//  MyListCellVC.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/13/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//

import UIKit

protocol MyListCellDelegate {
    func didTapViewBtn(url: String)
}

class MyListCellVC: UITableViewCell {
    
    @IBOutlet weak var myListTitleLbl: UILabel!
    @IBOutlet weak var myListComposerLbl: UILabel!
    
    var delegate: MyListCellDelegate?

    
    @IBAction func viewBtnPressed(_ sender: Any) {
        delegate?.didTapViewBtn(url: "\(url)57629.png")
    }
    

}
