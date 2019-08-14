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

}
