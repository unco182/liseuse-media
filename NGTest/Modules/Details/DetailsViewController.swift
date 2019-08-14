//
//  DetailsViewController.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class DetailsViewController: UITableViewController {
    var viewModel: DetailsViewModel!
    
    var isLoading = false {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewCellBuilder.prepareTableView(tableView)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        
    }
    
    func registerCell() {
        
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }
}

extension DetailsViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.datasource[indexPath.row]
        
        switch item {
        case .media(let article, let pictureUrl):
            return TableViewCellBuilder.articleMedia(tableView, indexPath, article: article, pictureUrl: pictureUrl)
        case .contentText(let mobileChapter):
            return TableViewCellBuilder.articleContentText(tableView, indexPath, mobileChapter: mobileChapter)
        case .contentImage(let mobileChapter):
            return TableViewCellBuilder.articleContentImage(tableView, indexPath, mobileChapter: mobileChapter)
        case .lead(let article):
            return TableViewCellBuilder.articleLead(tableView, indexPath, article: article)
        case .info(let article, let author):
            return TableViewCellBuilder.articleInfo(tableView, indexPath, article: article, author: author)
        }   
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoading {
            tableView.setLoader()
        }
        else {
            tableView.restore()
        }
        return self.viewModel?.datasource.count ?? 0
    }
}

extension DetailsViewController: DetailsProtocol {
    func isLoading(_ bool: Bool) {
        self.isLoading = bool
    }
}
