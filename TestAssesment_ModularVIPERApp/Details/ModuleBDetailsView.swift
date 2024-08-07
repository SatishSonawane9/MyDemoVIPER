//
//  ModuleBDetailsView.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation
import UIKit

class ModuleBDetailsView: UIViewController, ModuleBDetailsViewInterface {
    var presenter: ModuleBDetailsPresenterInterface?

    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    private func setupUI() {
        view.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func displayDetails(_ details: University) {
        label.text = "University: \(details.name)\nCountry: \(details.country)"
    }
}
