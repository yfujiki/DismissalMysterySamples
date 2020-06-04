//
//  DismissableViewController.swift
//  MysteriousDismisses
//
//  Created by Yuichi Fujiki on 4/6/20.
//  Copyright © 2020 yfujiki. All rights reserved.
//

import UIKit

class DismissableViewController: UIViewController {

    private let directPresenter: UIViewController

    init(directPresenter: UIViewController) {
        self.directPresenter = directPresenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(dismissFromDirectPresenter), for: .touchUpInside)
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

    @objc private func dismissFromDirectPresenter() {
        directPresenter.dismiss(animated: true)
    }
}
