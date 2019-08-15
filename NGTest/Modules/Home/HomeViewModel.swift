//
//  HomeViewModel.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation
//import RxSwift

protocol HomeProtocol: NSObject {
    func isLoading(_ bool: Bool)
    func showArticleDetails()
    func showFilterView()
}

class HomeViewModel {
    weak var homeView: HomeProtocol?
    
    var selectedArticle: Article?
    var selectedFilter: FilterUICell? {
        didSet {
            fetchFilteredArticle()
        }
    }
    
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
    
    func fetchFilteredArticle() {
        guard let filter = selectedFilter else { return }
        self.homeView?.isLoading(true)
        articles = S.sp.articleManager.fetchFilteredArticles(filter)
        self.homeView?.isLoading(false)
    }
    
    func setSelectedArticle(_ index: Int) {
        selectedArticle = articles[index]
        homeView?.showArticleDetails()
    }
    
    func filterButtonTapped() {
        homeView?.showFilterView()
    }
}
