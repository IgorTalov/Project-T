//
//  ViewController.swift
//  Project T
//
//  Created by Illarionova Violetta on 19/11/2018.
//  Copyright © 2018 Disruptvioletta LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var netWorkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        netWorkManager.getAllStocks { (stocks, error) in
            if error != nil {
                //Show Error
                return
            }
            
            print(stocks)
        }
    }
    
    
}

