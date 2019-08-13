//
//  DetailsViewModel.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation

protocol DetailsProtocol {
    func isLoading(_ bool: Bool)
}

class DetailsViewModel {
    var detailsView: DetailsProtocol?
    
    func fetchArticle() -> ArticleDetails {
        self.detailsView?.isLoading(true)
        
        return ArticleDetails(id: "", channelName: "", title: "", lead: "", visual: "", publicationDate: "", modificationDate: "", dataUrl: "", location: "", lienURL: "", showDate: true, relatedArticles: [], caption: "", credits: "", urlPattern: "", mobileChapters: [], authors: "")
    }
}
