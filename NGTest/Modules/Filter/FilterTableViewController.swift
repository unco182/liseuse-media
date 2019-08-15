//
//  FilterTableViewController.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {
    var viewModel: FilterViewModel!
    
    var isLoading = false {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupTableView() {
        TableViewCellBuilder.prepareTableView(tableView)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoading {
            tableView.setLoader()
        }
        else {
            tableView.restore()
        }
        return self.viewModel?.datasource.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.datasource[indexPath.row]
        
        switch item {
        case .resetFilter:
            return TableViewCellBuilder.resetFilter(
        case .channelItem(_, let isSelected):
            <#code#>
        case .olderArticle(_):
            <#code#>
        case .newerArticle(_):
            <#code#>
        }
    }
}