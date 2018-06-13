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
    
    func createArray() -> [SongData] {
        
        var songDatas: [SongData] = []
        
        let song1 = SongData(title: "10,000 Reasons (Bless the Lord)", composer: "Jonas Myrin and Matt Redman", url: "\(url)57629.png")
        let song2 = SongData(title: "40 Days", composer: "Matt Maher", url: "\(url)57202.png")
        let song3 = SongData(title: "A Rightful Place", composer: "Steve Angrisano", url: "\(url)57754.png")
        let song4 = SongData(title: "Above All", composer: "Lenny LeBlanc and Paul Baloche", url: "\(url)58344.png")
        let song5 = SongData(title: "Send Your Glory Down", composer: "Trevor Thomson", url: "\(url)57349.png")
        let song6 = SongData(title: "Shepherd Me, O God", composer: "Marty Haugen", url: "\(url)57267.png")
        let song7 = SongData(title: "Shout to the Lord", composer: "Darlene Zschech", url: "\(url)58386.png")
        let song8 = SongData(title: "Shouts of Joy", composer: "Ken Canedo", url: "\(url)9011.png")
        let song9 = SongData(title: "Signing of the Senses", composer: "Trevor Thomson", url: "\(url)57188.png")
        let song10 = SongData(title: "Silent Night", composer: "Tom Booth", url: "\(url)57269.png")
        let song11 = SongData(title: "Song of the Cross", composer: "HooKong", url: "\(url)57350.png")
        let song12 = SongData(title: "Sound of Hope", composer: "Ike Ndolo", url: "\(url)57351.png")
        let song13 = SongData(title: "Stand by Me", composer: "Tom Kendzia", url: "\(url)57270.png")
        let song14 = SongData(title: "Sweet Redeemer", composer: "Steve Angrisano", url: "\(url)57271.png")
        let song15 = SongData(title: "Table of Life", composer: "Steve Angrisano", url: "\(url)57272.png")


        
        songDatas.append(song1)
        songDatas.append(song2)
        songDatas.append(song3)
        songDatas.append(song4)
        songDatas.append(song5)
        songDatas.append(song6)
        songDatas.append(song7)
        songDatas.append(song8)
        songDatas.append(song9)
        songDatas.append(song10)
        songDatas.append(song11)
        songDatas.append(song12)
        songDatas.append(song13)
        songDatas.append(song14)
        songDatas.append(song15)
        
        return  songDatas
    }
}

extension MainVC: SongCellDelegate {
    
    func didTapViewBtn(url: String) {
        
        //let webVC = WebViewVC()
        
        let url = URL(string: url)!
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        
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

