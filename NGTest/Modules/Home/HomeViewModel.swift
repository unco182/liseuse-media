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
    func showArticleDetails()
}

class HomeViewModel {
    var homeView: HomeProtocol?
    
    var selectedArticle: Article?
    
    var articles: [Article] = []
    
    init(view: HomeProtocol) {
        homeView = view
        fetchArticles()
    }
    
    func fetchArticles() {
        self.homeView?.isLoading(true)
        articles = S.sp.articleManager.fetchArticles()
        self.homeView?.isLoading(false)
    }
    
    func setSelectedArticle(_ index: Int) {
        selectedArticle = articles[index]
        homeView?.showArticleDetails()
    }
}
