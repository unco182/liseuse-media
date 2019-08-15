//
//  ViewController.swift
//  NGTest

import UIKit

class HomeViewController: UITableViewController {
    var viewModel: HomeViewModel?
    
    var isLoading = true {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewCellBuilder.prepareTableView(tableView)
        tableView.separatorStyle = .none
        viewModel = HomeViewModel(view: self)
    }

    func updateUI() {
        self.tableView.reloadData()
    }
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        viewModel?.filterButtonTapped()
    }
    
    // MARK - Navigation
    // Pour les besoins du test, j'ai choisi d'utiliser les segue, cependant ce n'est pas forcement la meilleure pratique car cela donne une responsabilité au ViewController
    // qui devrait être dépourvu de logique. Dans le cadre d'un projet de grande envergure on aurait pu implémenter un Navigator ou un Coordinator.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "toDetails" {
            let destination = segue.destination as! DetailsViewController
            if let selected = viewModel?.selectedArticle {
                destination.viewModel = DetailsViewModel(article: selected , view: destination)
            }
        }
        else if segue.identifier == "toFilter" {
            let destination = segue.destination as! FilterTableViewController
            destination.viewModel = FilterViewModel(delegate: self, view: destination, selectedFilter: viewModel?.selectedFilter)
        }

    }

}

extension HomeViewController: HomeProtocol {
    func showArticleDetails() {
        performSegue(withIdentifier: "toDetails", sender: self)
    }
    
    func showFilterView() {
        performSegue(withIdentifier: "toFilter", sender: self)
    }
    
    func isLoading(_ bool: Bool) {
        self.isLoading = bool
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoading {
            tableView.setLoader()
        }
        else {
            tableView.restore()
        }
        return self.viewModel?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel?.articles[indexPath.row]
        guard let article = item else {
           return UITableViewCell()
        }
        let cell = TableViewCellBuilder.articlePreview(tableView, indexPath, article: article)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.setSelectedArticle(indexPath.row)
    }
}

extension HomeViewController: HomeFilterDelegate {
    func filterSelected(_ filter: FilterUICell) {
        viewModel?.selectedFilter = filter
    }
}

