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
        viewModel = HomeViewModel(view: self)
    }

    func updateUI() {
        self.tableView.reloadData()
    }
    
    // MARK - Navigation
    // Pour les besoins du test, j'ai choisi d'utiliser les segue, cependant ce n'est pas forcement la meilleure pratique car cela donne une responsabilité au ViewController
    // qui devrait être dépourvu de logique. Dans le cadre d'un projet de grande envergure on aurait pu implémenter un Navigator ou un Coordinator.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let destination = segue.destination as! DetailsViewController
        if let selected = viewModel?.selectedArticle {
            destination.viewModel = DetailsViewModel(article: selected , view: destination)
        }
    }

}

extension HomeViewController: HomeProtocol {
    func showArticleDetails() {
        performSegue(withIdentifier: "toDetails", sender: self)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        let item = viewModel?.articles[indexPath.row]
        guard let article = item else {
           return UITableViewCell()
        }
        cell.textLabel?.text = "[\(article.channelName)] \(article.title)"
        cell.detailTextLabel?.text = article.publicationDate
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.setSelectedArticle(indexPath.row)
    }
}

