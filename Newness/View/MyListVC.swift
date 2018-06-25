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
    
    //var myListSongData: [SongData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myListTableView.delegate = self
        myListTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myListTableView.reloadData()
        self.navigationController?.navigationBar.topItem?.title = "Spirit & Song"
    }
}

extension MyListVC: MyListCellDelegate {
    
    func didTapViewBtn(url: String) {
        
        guard let url = URL(string: url) else {
            print("Did not load URL")
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}

extension MyListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = myListSongArray[indexPath.row]
        
        let myListCell = myListTableView.dequeueReusableCell(withIdentifier: "myListCell") as! MyListCellVC
        myListCell.setDetails(title: data, composer: data)
        myListCell.delegate = self
        return myListCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myListSongArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myListSongArray.remove(at: indexPath.row)
            myListTableView.deleteRows(at: [indexPath], with: .fade)
            print("Row has been deleted")
        }
    }
}
