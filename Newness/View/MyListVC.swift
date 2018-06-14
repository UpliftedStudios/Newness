//
//  MyListVC.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/13/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//

import UIKit
import SafariServices

class MyListVC: UIViewController {
    
    @IBOutlet weak var myListTableView: UITableView!

    
    var detailArray: [SongData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailArray = myListSongArray
        
        myListTableView.delegate = self
        myListTableView.dataSource = self
        
        
        print(myListSongArray.count)

    }
}

extension MyListVC: MyListCellDelegate {
    
    func didTapViewBtn(url: String) {
        
        let url = URL(string: url)!
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        
    }
}

extension MyListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = detailArray[indexPath.row]
        print(data)
        
        let myListCell = myListTableView.dequeueReusableCell(withIdentifier: "myListCell") as! MyListCellVC
        myListCell.setDetails(title: data, composer: data)
        myListCell.delegate = self
        return myListCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailArray.count
    }
}
