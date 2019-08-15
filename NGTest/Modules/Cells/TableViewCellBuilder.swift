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
        // ArticleDetails
        tableView.registerCellNib(cellClass: MediaCell.self)
        tableView.registerCellNib(cellClass: ArticleInfoCell.self)
        tableView.registerCellNib(cellClass: ArticleContentTextCell.self)
        tableView.registerCellNib(cellClass: ArticleContentImageCell.self)
        tableView.registerCellNib(cellClass: ArticleLeadCell.self)
        
        // Home
        tableView.registerCellNib(cellClass: ArticlePreviewCell.self)
        
        // Filter
        tableView.registerCellNib(cellClass: FilterResetCell.self)
        tableView.registerCellNib(cellClass: FilterDateCell.self)
        tableView.registerCellNib(cellClass: FilterChannelCell.self)
    }
    
    // MARK: - Details Cells
    
    static func articleMedia(_ tableView: UITableView, _ indexPath: IndexPath, article: ArticleDetails, pictureUrl: String) -> MediaCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: MediaCell.self)
        cell.configure(article, pictureUrl)
        return cell
    }
    
    static func articleContentText(_ tableView: UITableView, _ indexPath: IndexPath, mobileChapter: MobileChapter) -> ArticleContentTextCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: ArticleContentTextCell.self)
        cell.configure(mobileChapter)
        return cell
    }
    
    static func articleContentImage(_ tableView: UITableView, _ indexPath: IndexPath, mobileChapter: MobileChapter) -> ArticleContentImageCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: ArticleContentImageCell.self)
        cell.configure(mobileChapter: mobileChapter)
        return cell
    }
    
    static func articleInfo(_ tableView: UITableView, _ indexPath: IndexPath, article: Article, author: String) -> ArticleInfoCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: ArticleInfoCell.self)
        cell.configure(article, author: author)
        return cell
    }
    
    static func articleLead(_ tableView: UITableView, _ indexPath: IndexPath, article: Article) -> ArticleLeadCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: ArticleLeadCell.self)
        cell.configure(article)
        return cell
    }
    
    // MARK: - Home Cells
    
    static func articlePreview(_ tableView: UITableView, _ indexPath: IndexPath, article: Article) -> ArticlePreviewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: ArticlePreviewCell.self)
        cell.configure(article)
        return cell
    }
    
    // MARK: - Filter Cells
    
    static func filterResetCell(_ tableView: UITableView, _ indexPath: IndexPath) -> FilterResetCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: FilterResetCell.self)
        return cell
    }
    
    static func filterDateCell(_ tableView: UITableView, _ indexPath: IndexPath, isSelected: Bool, name: String) -> FilterDateCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: FilterDateCell.self)
        cell.configure(isSelected: isSelected, name: name)
        return cell
    }
    
    static func filterChannelCell(_ tableView: UITableView, _ indexPath: IndexPath, isSelected: Bool, name: String) -> FilterChannelCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath, cellType: FilterChannelCell.self)
        cell.configure(isSelected: isSelected, name: name)
        return cell
    }
    
   
    
}

