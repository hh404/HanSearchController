//
//  ViewController.swift
//  HanSearchController
//
//  Created by hans on 2018/4/25.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = SearchViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true) {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

