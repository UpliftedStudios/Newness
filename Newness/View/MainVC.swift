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
    
    //var secondSongData: [SongData] = []
    var songData: [SongData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songData = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Spirit & Song"
        
        let leftBatBtn = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MainVC.leftSideBarBtnTapped(_:)))
        self.navigationItem.leftBarButtonItem = leftBatBtn
    }
    
    @objc func leftSideBarBtnTapped(_ sender: UIBarButtonItem!) {
        //let subscriptionVC = SubscriptionVC()
        //present(subscriptionVC, animated: true, completion: nil)
        print("button has been tapped")
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? MyListVC {
            destination.myListSongData = secondSongData
        } else {
            print("The data did not pass")
        }
    }*/
}

extension MainVC: SongCellDelegate {
    
    func didTapViewBtn(url: String) {

        guard let url = URL(string: url) else {
            print("Stopped at viewbtn")
            return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
    func didTapAddBtn(songData: SongData) {
        
        myListSongArray.append(songData)
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

