//
//  ViewController.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/12/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//


import UIKit
import SafariServices

class MainVC: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    
    var songData: [SongData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songData = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainVC: SongCellDelegate {
    
    func didTapViewBtn(url: String) {

        let url = URL(string: url)!
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
    func didTapAddBtn(songData: SongData) {
        
        let songData = songData
        myListSongArray.append(songData)
        print(songData.title)
        print(myListSongArray.count)
        
    }
}



extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = songData[indexPath.row]
        
        let songCell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongCellVC
        songCell.setDetails(title: data, composer: data)
        songCell.delegate = self
        return songCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songData.count
    }    
}

