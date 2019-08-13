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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension DetailsViewController: DetailsProtocol {
    func isLoading(_ bool: Bool) {
        
    }
}
