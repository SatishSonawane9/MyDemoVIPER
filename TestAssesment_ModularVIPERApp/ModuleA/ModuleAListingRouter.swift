//
//  ModuleAListingRouter.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation
import UIKit

class ModuleAListingRouter: ModuleAListingRouterInterface {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = ModuleAListingView()
        let presenter: ModuleAListingPresenterInterface & ModuleAListingInteractorOutputInterface = ModuleAListingPresenter()
        let interactor: ModuleAListingInteractorInterface = ModuleAListingInteractor()
        let router: ModuleAListingRouterInterface = ModuleAListingRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateToDetails(with university: University) {
        let detailsViewController = ModuleBDetailsRouter.createModule(with: university)
        viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
