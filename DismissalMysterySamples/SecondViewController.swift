//
//  SecondViewController.swift
//  DismissalMysterySamples
//
//  Created by Yuichi Fujiki on 4/6/20.
//  Copyright © 2020 yfujiki. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func presentSearchController() {
        let vc = SearchController()
        present(vc, animated: true)
    }
}

