//
//  University.swift
//  TestAssesment_ModularVIPERApp
//
//  Created by Satish Sonawane on 07/08/24.
//

import Foundation
import RealmSwift

class University: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""

    override static func primaryKey() -> String? {
        return "name"
    }
}
