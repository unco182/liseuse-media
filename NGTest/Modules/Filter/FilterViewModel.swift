//
//  FilterViewModel.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation

enum FilterUICell {
    case resetFilter
    case channelItem(_ name: String, isSelected: Bool)
    case olderArticle(_ isSelected: Bool)
    case newerArticle(_ isSelected: Bool)
}

protocol HomeFilterDelegate {
    func filterSelected(_ filter: FilterUICell)
}

protocol FilterProtocol {
    func isLoading(_ bool: Bool)
}

class FilterViewModel {

    var filterView: FilterProtocol
    
    var datasource: [FilterUICell] = []
    
    var channels: [String] = []
    var selectedFilter: FilterUICell?

    init(delegate: HomeFilterDelegate, view: FilterProtocol, selectedFilter: FilterUICell?) {
        self.filterView = view
        self.selectedFilter = selectedFilter
        self.fetchChannelNames()
    }
    
    func fetchChannelNames() {
        channels = S.sp.articleManager.fetchChannelNames()
        buildDatasource()
    }
    
    func buildDatasource() {
        self.filterView.isLoading(true)
        if let _ = selectedFilter {
            datasource.append(.resetFilter)
        }

        for current in channels {
        
            if let activeFilter = selectedFilter{
                switch activeFilter {
                    
                case .resetFilter, .olderArticle(_), .newerArticle(_) :
                    break
                case .channelItem(let channel, let isSelected):
                    datasource.append(.channelItem(current, isSelected:  activeFilter == .channelItem(channel, isSelected: isSelected)))
                }
            }
            else {
              datasource.append(.channelItem(current, isSelected: false))
            }
        }
        let isOlderActive = (selectedFilter! == .olderArticle(true))
        let isNewerActive = (selectedFilter! == .newerArticle(true))
        datasource.append(.olderArticle(isOlderActive))
        datasource.append(.newerArticle(isNewerActive))
       
        self.filterView.isLoading(false)
        
    }
}
