//
//  ArticleDO.swift
//  NGTest
//

import Foundation

struct Article: Codable {

    let id: String
    let channelName: String
    let title: String
    let lead: String
    let visual: String // urlPattern
    let publicationDate: String
    let modificationDate: String
    let dataUrl: String //

    private enum CodingKeys: String, CodingKey {
        case id
        case channelName
        case title
        case publicationDate
        case lead
        case visual
        case modificationDate
        case dataUrl
    }
}

// Je n'ai pas mappé ces informations car tout les articles du json fournis contenait les mêmes informations ou n'était pas necessaire pour ce test selon moi
// J'aurais cependant pu préparer des enums pour 'type', 'className' (et 'channelName')


//"type": "nouvelles",
//"visual": [
//{
//"id": "1504205",
//"className": "photo",
//}
//],
//"sharedId": "wcm:article:5150462",
//"className": "article"
