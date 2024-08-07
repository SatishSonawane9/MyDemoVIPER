//
//  ModuleAListingPresenter.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation

class ModuleAListingPresenter: ModuleAListingPresenterInterface, ModuleAListingInteractorOutputInterface {
    weak var view: ModuleAListingViewInterface?
    var interactor: ModuleAListingInteractorInterface?
    var router: ModuleAListingRouterInterface?

    var universities: [University] = []

    func viewDidLoad() {
        interactor?.fetchUniversities()
    }

    func didSelectUniversity(_ university: University) {
        router?.navigateToDetails(with: university)
    }

    func showUniversities(_ universities: [University]) {
        self.universities = universities
        view?.showUniversities(universities)
    }

    func showError(_ error: String) {
        view?.showError(error)
    }
}
