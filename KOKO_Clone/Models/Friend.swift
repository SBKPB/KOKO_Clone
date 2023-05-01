//
//  Friend.swift
//  KOKO_Interview
//
//  Created by Ben Stark on 2023/4/28.
//

import Foundation

struct Friend: Codable {
    var name: String
    var status: Int
    var isTop: String
    var fid: String
    var updateDate: String
}


struct FriendResponse: Codable {
    var response: [Friend]
}
