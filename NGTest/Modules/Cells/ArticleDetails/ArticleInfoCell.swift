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

    func configure(_ article: Article, author: String) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        guard let modificationDate = df.date(from: article.modificationDate), let publicationDate = df.date(from: article.publicationDate) else { return }
        df.dateFormat = "dd/MM/yyyy"
        
        let modificationDay = df.string(from: modificationDate)
        let publicationDay = df.string(from: publicationDate)
        
        df.dateFormat = "HH:mm"

        let modificationHour = df.string(from: modificationDate)
        let publicationHour = df.string(from: publicationDate)

        titleLabel.text = article.title
        dateInfoLabel.text = "Dernière modification le \(modificationDay) à \(modificationHour)\nPublié le \(publicationDay) à \(publicationHour)"

        authorsLabel.isHidden = author.isEmpty
        authorsLabel.text = "Article par \(author)"
    }
    
}
