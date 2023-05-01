//
//  kokoID.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/28.
//

import Foundation


struct User: Codable {
    var name: String
    var kokoid: String?
}


struct UserResponse: Codable {
    var response: [User]
}
