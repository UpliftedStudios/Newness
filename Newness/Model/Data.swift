//
//  Data.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/12/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//

import Foundation

let url = "https://s3.amazonaws.com/snapshot.icrcdn.net/full/"

class SongData {
    
    var title: String
    var url: String
    var composer: String
    
    init (title: String, composer: String, url: String) {
        self.title = title
        self.url = url
        self.composer = composer
    }
}












// MARK: Old arrays
//var songNames = ["10,000 Reasons (Bless the Lord)", "40 Days", "A Rightful Place", "Above All"]

//let composers = ["Matt Redman", "Matt Maher", "Steve Angrisano", "Lenny LeBlanc and Paul Baloche"]

//let urls = ["https://s3.amazonaws.com/snapshot.icrcdn.net/full/57629.png", "https://s3.amazonaws.com/snapshot.icrcdn.net/full/57202.png", "https://s3.amazonaws.com/snapshot.icrcdn.net/full/57754.png", "https://s3.amazonaws.com/snapshot.icrcdn.net/full/58344.png"]
