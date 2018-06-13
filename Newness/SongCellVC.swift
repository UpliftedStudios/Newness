//
//  SongCellVC.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/12/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//
import UIKit

protocol SongCellDelegate {
    func didTapViewBtn(url: String)
}

class SongCellVC: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!

    var songItem: SongData!
    var delegate: SongCellDelegate?
    
    func setTitle(title: SongData) {
        songItem = title
        titleLbl.text = title.title
    }

    @IBAction func viewBtnTapped(_ sender: Any) {
        delegate?.didTapViewBtn(url: songItem.url)
    }
}
