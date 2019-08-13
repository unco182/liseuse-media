//
//  ArticleInfoCell.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class ArticleInfoCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateInfoLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup() {
        
    }
    
    func configure(_ article: ArticleDetails) {
        titleLabel.text = article.title
        dateInfoLabel.text = "dernière modification le \(article.modificationDate), publié le \(article.publicationDate)"
        authorsLabel.text = "article par \(article.authors)"
    }
    
}
