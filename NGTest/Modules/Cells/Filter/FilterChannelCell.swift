//
//  FilterChannelCell.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit

class FilterChannelCell: UITableViewCell {
    @IBOutlet weak var filterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(isSelected: Bool, name: String) {
        filterNameLabel.text = name
        backgroundColor = isSelected ? .lightGray : .white
    }
}
