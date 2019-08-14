//
//  TableViewCellBuilder.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import Foundation
import UIKit

final class TableViewCellBuilder {
    private init() {}
    
    static func prepareTableView(_ tableView: UITableView) {
        tableView.registerCellNib(cellClass: MediaCell.self)
        tableView.registerCellNib(cellClass: ArticleInfoCell.self)
        tableView.registerCellNib(cellClass: ArticleContentCell.self)
//        tableView.registerCellNib(cellClass: FullButtonTableViewCell.self)
        
    }

    
    static func articleMedia(_ tableView: UITableView, _ indexPath: IndexPath, article: ArticleDetails) -> MediaCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: MediaCell.self)
//        cell.setup()
        return cell
    }
    
    static func articleContent(_ tableView: UITableView, _ indexPath: IndexPath, article: ArticleDetails) -> ArticleContentCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: ArticleContentCell.self)
        //        cell.setup()
        return cell
    }
    
    static func articleInfo(_ tableView: UITableView, _ indexPath: IndexPath, article: ArticleDetails) -> ArticleInfoCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: ArticleInfoCell.self)
        //        cell.setup()
        return cell
    }
    
   
    
}

