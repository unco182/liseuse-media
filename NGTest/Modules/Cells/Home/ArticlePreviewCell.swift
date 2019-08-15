//
//  ArticlePreviewCell.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class ArticlePreviewCell: UITableViewCell {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var channelNameLabel: UILabel!
    @IBOutlet private weak var channelView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var leadLabel: UILabel!
    @IBOutlet private weak var articleImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    func setup() {
        self.containerView.layer.cornerRadius = 20
        self.containerView.clipsToBounds = true
        self.channelView.layer.cornerRadius = self.channelView.frame.height / 2
    }

    
    func configure(_ article: Article) {
        titleLabel.text = article.title
        leadLabel.text = article.lead
        channelNameLabel.text = article.channelName
        if let urlPattern =  article.visual.first?.urlPattern, let url = URL(string: urlPattern) {
            articleImageView.setRemoteImage(url)
        }

    }
}
