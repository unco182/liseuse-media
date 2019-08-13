//
//  HomeViewModel.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation
//import RxSwift

protocol HomeProtocol {
    func isLoading(_ bool: Bool)
}

class HomeViewModel {
    var homeView: HomeProtocol?
    
    func fetchArticles() -> [Article] {
        self.homeView?.isLoading(true)
        
        return []
    }
}
