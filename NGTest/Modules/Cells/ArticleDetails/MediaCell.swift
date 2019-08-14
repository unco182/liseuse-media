//
//  MediaCell.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {
    @IBOutlet private weak var captionView: UIView!
    @IBOutlet private weak var pictureImageView: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
        
    }
    
    func setup() {
        self.layer.cornerRadius = 8
    }

    func configure(_ article: ArticleDetails,_ pictureUrl: String) {
        if let url = URL(string: pictureUrl), !pictureUrl.isEmpty {
            pictureImageView.setRemoteImage(url)
        }
        if let caption = article.visual.first?.caption, let credits = article.visual.first?.credits {
            captionView.isHidden = false
            captionLabel.text = "\(caption) (\(credits))"
        }
        else {
            captionView.isHidden = true
        }
    }
}
