//
//  SubscriptionVC.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/21/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//

import UIKit

class SubscriptionVC: UIViewController {
    
    @IBOutlet weak var SubLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        guard let path = Bundle.main.path(forResource: "csvjson", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)

        do {
        let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print(json)
            
            dateFormatter.dateFormat = "MMMM-dd"
            let dateString = dateFormatter.string(from: currentDate)
            print(dateString)
            
            guard let array = json as? [String: Any] else { return }
            
            guard let date = array["\(dateString)"] as? [String: String] else { return }
            guard let body = date["title"] else { return }
            print(body)
            
            

            SubLbl.text = body
            
        } catch {
            print(error)
        }
    }
    
    @IBAction func breakingBreadBtnTapped(_ sender: Any) {
    }
    
    @IBAction func spiritAndSongBtnTapped(_ sender: Any) {

        
    }
}
