//
//  Visual.swift
//  NGTest
//
//  Created by Alban Pellegrini on 13/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation

struct Visual: Codable {

    let urlPattern: String?

    private enum CodingKeys: String, CodingKey {
        case urlPattern

    }
}
