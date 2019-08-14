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
    case media(article: Article)
    case info(article: Article)
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
        datasource = [.media(article: article),
                      .info(article: article),
                      .lead(article: article)]
        for current in articleDetails?.mobileChapters ?? [] {
            switch current.contentType {
            case "image":
                datasource.append(.contentImage(chapter: current))
            case "paragraph":
                datasource.append(.contentText(chapter: current))
            default:
                continue
            }
        }

        self.detailsView.isLoading(false)
        
    }
}
