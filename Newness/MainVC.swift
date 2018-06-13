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
        print(songData)
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func createArray() -> [SongData] {
        
        var songDatas: [SongData] = []
        
        let song1 = SongData(title: "10,000 Reasons (Bless the Lord)", url: "https://s3.amazonaws.com/snapshot.icrcdn.net/full/57629.png")
        let song2 = SongData(title: "40 Days", url: "https://s3.amazonaws.com/snapshot.icrcdn.net/full/57202.png")
        let song3 = SongData(title: "A Rightful Place", url: "https://s3.amazonaws.com/snapshot.icrcdn.net/full/57754.png")
        let song4 = SongData(title: "Above All", url: "https://s3.amazonaws.com/snapshot.icrcdn.net/full/58344.png")
        
        songDatas.append(song1)
        songDatas.append(song2)
        songDatas.append(song3)
        songDatas.append(song4)
        
        return  songDatas
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WebViewVC {
            let url = urls[(tableView.indexPathForSelectedRow?.row)!]
            destination.songData = url
        }
    }*/
}

extension MainVC: SongCellDelegate {
    
    func didTapViewBtn(url: String) {
        
        let url = URL(string: url)!
        print(url)
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        
        
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = songData[indexPath.row]
        
        let songCell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongCellVC
        songCell.setTitle(title: data)
        songCell.delegate = self
        
        return songCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songData.count
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showWebViewVC", sender: self)
    }*/
    
}

