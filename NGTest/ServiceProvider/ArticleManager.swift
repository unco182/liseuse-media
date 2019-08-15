//
//  ArticleManager.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Alamofire
import Foundation
import RxAlamofire
import RxSwift

enum ArticleManagerError: Error {
}

let networkTimeoutTime: Double = 45

class ArticleManager: NSObject {
    func fetchArticles() -> [Article] {
        var articles: [Article] = []
        if let path = Bundle.main.path(forResource: "articles", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                articles = try decoder.decode([Article].self, from: data)
                
            } catch {
                print(error.localizedDescription)
            }
        }
        return articles
    }
    
    func fetchArticlesDetails(url: String, parameters: [String: Any]? = nil) -> Single<ArticleDetails> {
        return ArticleManager.fetchArticleDetails(url: url, parameters: parameters)
    }
    
    private static func fetchArticleDetails(url: String, parameters: [String: Any]? = nil) -> Single<ArticleDetails> {
        return json(.get, url)
            .timeout(networkTimeoutTime, scheduler: MainScheduler.instance)
            .mapObject(type: ArticleDetails.self)
            .asSingle()
    }
    
    func fetchChannelNames() -> [String] {
        return fetchArticles().map { (article) -> String in
            return article.channelName
        }.unique
    }
    
    func fetchFilteredArticles(_ filter: FilterUICell) -> [Article] {
        switch filter {

        case .resetFilter:
            return fetchArticles()
        case .channelItem(_, _):
            return fetchArticles().filter({ (article) -> Bool in
                return filter == .channelItem(article.channelName, isSelected: false)
            })
        case .olderArticle(_):
            return fetchArticles().sorted(by: { (article1, article2) -> Bool in
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
                guard let article1ModificationDate = df.date(from: article1.modificationDate), let article2ModificationDate = df.date(from: article2.modificationDate) else { return false }
                return article1ModificationDate < article2ModificationDate
            })
        case .newerArticle(_):
            return fetchArticles().sorted(by: { (article1, article2) -> Bool in
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
                guard let article1ModificationDate = df.date(from: article1.modificationDate), let article2ModificationDate = df.date(from: article2.modificationDate) else { return false }
                return article1ModificationDate > article2ModificationDate
            })

        }

    }

}
