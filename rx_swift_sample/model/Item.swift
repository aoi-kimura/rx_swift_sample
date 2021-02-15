//
//  Item.swift
//  rx_swift_sample
//
//  Created by 木村葵 on 2020/07/13.
//  Copyright © 2020 irohamiyamoto. All rights reserved.
//

import Foundation

struct Item: Codable {
    
    let body: String
    let createdAt: String
    let title: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case body
        case createdAt = "created_at"
        case title
        case url
    }
}
