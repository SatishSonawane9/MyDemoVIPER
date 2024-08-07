//
//  ModuleBDetailsPresenter.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation
import Foundation

class ModuleBDetailsPresenter: ModuleBDetailsPresenterInterface {
    weak var view: ModuleBDetailsViewInterface?
    var interactor: ModuleBDetailsInteractorInterface?
    var router: ModuleBDetailsRouterInterface?
    var university: University?

    func viewDidLoad() {
        if let university = university {
            view?.displayDetails(university)
        }
    }

    func refreshListing() {
        router?.refreshListingScreen()
    }
}
