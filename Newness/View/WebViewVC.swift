//
//  WebViewVC.swift
//  Newness
//
//  Created by Marcus Hidalgo on 6/12/18.
//  Copyright © 2018 Marcus Hidalgo. All rights reserved.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    var songUrl = "\(url)57629.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: songUrl)
        let request = URLRequest(url: url!)
        webView.load(request)
    
    }
}

