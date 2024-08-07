//
//  ModuleAListingProtocols.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation
import UIKit


protocol ModuleAListingPresenterInterface: AnyObject {
    var view: ModuleAListingViewInterface? { get set }
    var interactor: ModuleAListingInteractorInterface? { get set }
    var router: ModuleAListingRouterInterface? { get set }
    func viewDidLoad()
    func didSelectUniversity(_ university: University)
    func showUniversities(_ universities: [University])
    func showError(_ error: String)
}

protocol ModuleAListingInteractorInterface: AnyObject {
    var presenter: ModuleAListingInteractorOutputInterface? { get set }
    func fetchUniversities()
}

protocol ModuleAListingInteractorOutputInterface: AnyObject {
    func showUniversities(_ universities: [University])
    func showError(_ error: String)
}

protocol ModuleAListingRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
    static func createModule() -> UIViewController
    func navigateToDetails(with university: University)
}
protocol ModuleAListingViewInterface: AnyObject {
    func showUniversities(_ universities: [University])
    func showError(_ error: String)
}
