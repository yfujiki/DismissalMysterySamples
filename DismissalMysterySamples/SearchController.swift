//
//  SearchController.swift
//  PresentViewControllerTests
//
//  Created by Yuichi Fujiki on 1/6/20.
//  Copyright © 2020 yfujiki. All rights reserved.
//

import UIKit

class SearchController: UISearchController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(presentFull), for: .touchUpInside)
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let pvc = presentingViewController {
            NSLog("Presenting view controller of \(type(of: self)) is \(type(of: pvc))")
        } else {
            NSLog("No presenting view controller for \(type(of: self))")
        }
    }

    @objc func presentFull() {
        let vc = DismissableViewController(directPresenter: self)
        vc.modalPresentationStyle = .fullScreen // .formSheet/.pageSheet/.popover/.overFullScreen
        present(vc, animated: true)
    }
}
