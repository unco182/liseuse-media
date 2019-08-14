//
//  MobileChapter.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation

struct MobileChapter: Codable {
    
    let text: String?
    let contentType: String
    let title: String?
    let urlPattern: String?
    let caption: String?
    
    private enum CodingKeys: String, CodingKey {
        case urlPattern
        case text
        case contentType
        case title
        case caption
    }
}
