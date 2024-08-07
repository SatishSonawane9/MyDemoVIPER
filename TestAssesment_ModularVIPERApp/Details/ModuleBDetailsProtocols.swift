//
//  ModuleBDetailsProtocols.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation
import UIKit

protocol ModuleBDetailsViewInterface: AnyObject {
    func displayDetails(_ details: University)
}

protocol ModuleBDetailsPresenterInterface: AnyObject {
    var view: ModuleBDetailsViewInterface? { get set }
    var interactor: ModuleBDetailsInteractorInterface? { get set }
    var router: ModuleBDetailsRouterInterface? { get set }
    var university: University? { get set }
    func viewDidLoad()
    func refreshListing()
}

protocol ModuleBDetailsInteractorInterface: AnyObject {}

protocol ModuleBDetailsRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
    static func createModule(with item: University) -> UIViewController
    func refreshListingScreen()
}
