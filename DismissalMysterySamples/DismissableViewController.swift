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

        let button1 = UIButton()
        button1.setTitle("Dismiss from presenter", for: .normal)
        button1.setTitleColor(.systemBlue, for: .normal)
        button1.addTarget(self, action: #selector(dismissFromDirectPresenter), for: .touchUpInside)
        view.addSubview(button1)

        button1.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -32)
        ])

        let button2 = UIButton()
        button2.setTitle("Dismiss myself directly", for: .normal)
        button2.setTitleColor(.systemBlue, for: .normal)
        button2.addTarget(self, action: #selector(dismissMyself), for: .touchUpInside)
        view.addSubview(button2)

        button2.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32)
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

    @objc private func dismissMyself() {
        dismiss(animated: true)
    }
}
