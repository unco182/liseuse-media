//
//  DetailsViewModel.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation
import RxSwift

enum DetailsUICell {
    case media(article: ArticleDetails, pictureUrl: String)
    case info(article: Article, author: String)
    case lead(article: Article)
    case contentText(chapter: MobileChapter)
    case contentImage(chapter: MobileChapter)
}

protocol DetailsProtocol {
    func isLoading(_ bool: Bool)
}

class DetailsViewModel {
    var article: Article
    var articleDetails: ArticleDetails?
    var detailsView: DetailsProtocol
    
    var datasource: [DetailsUICell] = []
    
    var disposeBag = DisposeBag()
    
    init(article: Article, view: DetailsProtocol) {
        self.article = article
        self.detailsView = view
        fetchArticleDetails()
    }
    
    func fetchArticleDetails() {
        S.sp.articleManager.fetchArticlesDetails(url: self.article.dataUrl).subscribe(onSuccess: { [unowned self] articleDetails in
            self.articleDetails = articleDetails
            self.buildDatasource()
        }) { (e) in
            //Generic error handling behavior to implement
            print(e.localizedDescription)
        }.disposed(by: disposeBag)
    }
    
    func buildDatasource() {
        self.detailsView.isLoading(true)
        if let aDetails = articleDetails {
            datasource = [.media(article: aDetails, pictureUrl: article.visual.first?.urlPattern ?? ""),
                          .info(article: article, author: aDetails.byLine ?? ""),
                          .lead(article: article)]
            for current in articleDetails?.mobileChapters ?? [] {
                switch current.contentType {
                case "image":
                    continue
                //                datasource.append(.contentImage(chapter: current)) // Il me manquait les sizeName afin de pouvoir recupérer les photos illustratives des articles
                case "paragraph":
                    datasource.append(.contentText(chapter: current))
                default:
                    continue
                }
            }
        }

        self.detailsView.isLoading(false)
        
    }
}
