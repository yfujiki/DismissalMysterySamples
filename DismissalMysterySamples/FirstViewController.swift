//
//  FirstViewController.swift
//  DismissalMysterySamples
//
//  Created by Yuichi Fujiki on 4/6/20.
//  Copyright © 2020 yfujiki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentFromCurrentContext() {
        let vc = CurrentContextViewController()
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: true)
    }
}

