//
//  ViewController.swift
//  NGTest

import UIKit

class MainViewController: UITableViewController {

    private var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "articles", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                articles = try decoder.decode([Article].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        let item = articles[indexPath.row]
        cell.textLabel?.text = "[\(item.channelName)] \(item.title)"
        cell.detailTextLabel?.text = item.publicationDate
        return cell
    }
    
    // MARK - Navigation
    // Pour les besoins du test, j'ai choisi d'utiliser les segue, cependant ce n'est pas forcement la meilleure pratique car cela donne une responsabilité au ViewController
    // qui devrait être dépourvu de logique. Dans le cadre d'un projet de grande envergure on aurait pu implémenter un Navigator ou un Coordinator.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailsViewController
        //        destination.viewModel = DetailsViewModel(id: viewModel.selectedId)
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
}

