//
//  ArticleManager.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

//import Alamofire
import Foundation
//import RxAlamofire
//import RxSwift

enum ArticleManagerError: Error {
}

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
//    func fetchPlaceDetails(placeId: String) -> Single<GoogleCoffeeDetails> {
//        let l = Locale.current
//        return GooglePlacesManager.fetchPlaceDetails(parameters: ["key": apiKey, "language": l.languageCode, "placeid" : "\(placeId)"])
//    }
//
//    private static func fetchPlaceDetails(parameters: [String: Any]? = nil) -> Single<GoogleCoffeeDetails> {
//        return json(.get, GooglePlacesManager.detailsURL, parameters: parameters,
//                    encoding: URLEncoding.queryString)
//            .timeout(AppConstants.networkTimeoutTime, scheduler: MainScheduler.instance)
//            .mapObject(type: GoogleCoffeeDetails.self)
//            .asSingle()
//    }
}
