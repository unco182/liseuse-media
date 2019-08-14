//
//  DetailsViewModel.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation

enum DetailsUICell {
    case media(article: ArticleDetails)
    case info(article: ArticleDetails)
    case lead(article: ArticleDetails)
    case content(article: ArticleDetails)
}

protocol DetailsProtocol {
    func isLoading(_ bool: Bool)
}

class DetailsViewModel {
    var id: String
    var article: ArticleDetails?
    var detailsView: DetailsProtocol
    
    var datasource: [DetailsUICell] = []
    
    init(id: String, view: DetailsProtocol) {
        self.id = id
        self.detailsView = view
        self.article = fetchArticle()
    }
    
    func fetchArticle() -> ArticleDetails {

        return ArticleDetails(id: "", channelName: "", title: "", lead: "", visual: "", publicationDate: "", modificationDate: "", dataUrl: "", location: "", lienURL: "", showDate: true, relatedArticles: [], caption: "", credits: "", urlPattern: "", mobileChapters: [], authors: "")
    }
    
    func buildDatasource() {
        self.detailsView.isLoading(true)
        let article = fetchArticle()
        datasource = [.media(article: article),
                      .info(article: article),
                      .lead(article: article),
                      .content(article: article)]
        self.detailsView.isLoading(false)
        
    }
}
