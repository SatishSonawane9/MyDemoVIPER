//
//  ModuleBDetailsRouter.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation
import UIKit

class ModuleBDetailsRouter: ModuleBDetailsRouterInterface {
    weak var viewController: UIViewController?

    static func createModule(with university: University) -> UIViewController {
        let view = ModuleBDetailsView()
        let presenter: ModuleBDetailsPresenterInterface = ModuleBDetailsPresenter()
        let interactor: ModuleBDetailsInteractorInterface = ModuleBDetailsInteractor()
        let router: ModuleBDetailsRouterInterface = ModuleBDetailsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.university = university
        router.viewController = view

        return view
    }

    func refreshListingScreen() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

