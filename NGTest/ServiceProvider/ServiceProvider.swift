//
//  ServiceProvider.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class S: NSObject {
    static let sp = ServicesProvider()
}

class ServicesProvider: NSObject {
    private(set) lazy var articleManager = ArticleManager()
}

