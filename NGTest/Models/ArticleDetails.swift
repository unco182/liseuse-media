//
//  ArticleDetails.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

struct ArticleDetails: Codable {
    
    let id: Int
    let channelName: String
    let title: String
    let lead: String
    let visual: [Visual] // urlPattern
//    let publicationDate: String
    let modificationDate: String
    let dataUrl: String? //
    
    let location: String?
    let lienURL: String
//    let showDate: Bool?
//    let relatedArticles: [String]? // RelatedArticle
    let caption: String?
    let credits: String?
    let urlPattern: String? // pictureUrl
    let mobileChapters: [MobileChapter] //mobileChapters.index.text
    let byLine: String?
    
    
    // - MARK computed values
    
//    let text: String = {
//        return mobileChapters.flatMap(
//    }
    
    
    private enum CodingKeys: String, CodingKey {
        case id
        case channelName
        case title
//        case publicationDate
        case lead
        case visual
        case modificationDate
        case dataUrl

        case location
        case lienURL
//        case showDate
//        case relatedArticles
        case caption
        case credits
        case urlPattern
        case mobileChapters
        case byLine
    }
}
