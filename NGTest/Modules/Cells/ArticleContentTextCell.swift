//
//  ArticleContentCell.swift
//  NGTest
//
//  Created by Alban Pellegrini on 12/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class ArticleContentTextCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ chapter: MobileChapter) {
        contentLabel.text = chapter.text ?? ""
    }

}
