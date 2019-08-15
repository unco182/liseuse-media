//
//  FilterUICell+Equatable.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation

func ==(a: FilterUICell, b: FilterUICell) -> Bool {
    switch(a) {
    case .resetFilter:
        switch b {
        case .resetFilter:
            return true
        case .channelItem(_, _), .olderArticle(_), .newerArticle(_):
            return false
        }
    case .channelItem(let aChannelName, _):
        switch b {
        case .resetFilter, .olderArticle(_), .newerArticle(_) :
            return false
        case .channelItem(let bChannelName, _):
            return bChannelName == aChannelName
            
        }
    case .olderArticle(_):
        switch b {
        case .olderArticle:
            return true
        case .channelItem(_, _), .resetFilter, .newerArticle(_):
            return false
        }
    case .newerArticle(_):
        switch b {
        case .newerArticle(_):
            return true
        case .channelItem(_, _), .olderArticle(_), .resetFilter:
            return false
        }
        
    }
}
