//
//  MediaCell.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
        
    }
    
    func setup() {
        self.layer.cornerRadius = 8
    }

    
    func configure(_ article: ArticleDetails) {
//        setup()
//        pictureImageView

    }
    
    
}
