//
//  CurrentContextViewController.swift
//  MysteriousDismisses
//
//  Created by Yuichi Fujiki on 4/6/20.
//  Copyright © 2020 yfujiki. All rights reserved.
//

import UIKit

class CurrentContextViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Close button
        let closeButton = UIButton.systemButton(with: UIImage(systemName: "clear")!, target: self, action: #selector(close))
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        // Present button
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

    override func viewWillAppear(_ animated: Bool) {
        NSLog("viewWillAppear of \(type(of: self)) is called")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let pvc = presentingViewController {
            NSLog("Presenting view controller of \(type(of: self)) is \(type(of: pvc))")
        } else {
            NSLog("No presenting view controller for \(type(of: self))")
        }
    }

    @objc func close() {
        dismiss(animated: true)
    }

    @objc func presentFull() {
        let vc = DismissableViewController(directPresenter: self)
        vc.modalPresentationStyle = .fullScreen // .formSheet/.pageSheet/.popover/.overFullScreen
        present(vc, animated: true)
    }
}
