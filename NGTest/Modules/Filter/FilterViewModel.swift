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

protocol HomeFilterDelegate: NSObject {
    func filterSelected(_ filter: FilterUICell)
}

protocol FilterProtocol: NSObject {
    func isLoading(_ bool: Bool)
    func dismiss()
}

class FilterViewModel {

    weak var filterView: FilterProtocol?
    weak var delegate: HomeFilterDelegate?
    
    var datasource: [FilterUICell] = []
    
    var channels: [String] = []
    var selectedFilter: FilterUICell?

    init(delegate: HomeFilterDelegate, view: FilterProtocol, selectedFilter: FilterUICell?) {
        self.filterView = view
        self.delegate = delegate
        self.selectedFilter = selectedFilter
        self.fetchChannelNames()
    }
    
    func fetchChannelNames() {
        channels = S.sp.articleManager.fetchChannelNames()
        buildDatasource()
    }
    
    func buildDatasource() {
        self.filterView?.isLoading(true)
        var isOlderActive = false
        var isNewerActive = false
        
        if let filter = selectedFilter {
            if !(filter == .resetFilter) {
               datasource.append(.resetFilter)
            }
            
            
            isOlderActive = (filter == .olderArticle(true))
            isNewerActive = (filter == .newerArticle(true))
        }

        for current in channels {
        
            if let activeFilter = selectedFilter{
                switch activeFilter {
                    
                case .resetFilter, .olderArticle(_), .newerArticle(_) :
                    datasource.append(.channelItem(current, isSelected: false))
                case .channelItem(_, let isSelected):
                    datasource.append(.channelItem(current, isSelected:  activeFilter == .channelItem(current, isSelected: isSelected)))
                }
            }
            else {
              datasource.append(.channelItem(current, isSelected: false))
            }
        }

        datasource.append(.olderArticle(isOlderActive))
        datasource.append(.newerArticle(isNewerActive))
       
        self.filterView?.isLoading(false)
        
    }
    
    func filterTapped(_ filter: FilterUICell) {
        delegate?.filterSelected(filter)
        filterView?.dismiss()
    }
}
