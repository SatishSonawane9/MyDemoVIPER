//
//  ModuleAListingInteractor.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation
import RealmSwift

class ModuleAListingInteractor: ModuleAListingInteractorInterface {
    weak var presenter: ModuleAListingInteractorOutputInterface?

    func fetchUniversities() {
        let url = URL(string: "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.fetchFromDB(with: error.localizedDescription)
                return
            }
            guard let data = data else {
                self.fetchFromDB(with: "No data received")
                return
            }

            do {
                let universities = try JSONDecoder().decode([University].self, from: data)
                self.cacheUniversities(universities)
                self.presenter?.showUniversities(universities)
            } catch {
                self.fetchFromDB(with: error.localizedDescription)
            }
        }
        task.resume()
    }

    private func fetchFromDB(with error: String) {
        let realm = try! Realm()
        let universities = realm.objects(University.self)
        if universities.isEmpty {
            self.presenter?.showError(error)
        } else {
            self.presenter?.showUniversities(Array(universities))
        }
    }

    private func cacheUniversities(_ universities: [University]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(universities, update: .all)
        }
    }
}
