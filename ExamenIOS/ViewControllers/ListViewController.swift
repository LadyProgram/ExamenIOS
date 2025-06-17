//
//  ViewController.swift
//  ExamenIOS
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var films: [Film] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        
        searchFilms(query: "Matrix")
    }
    
    func searchFilms(query: String) {
        Task {
            films = await FilmProvider.findFilmByName(query: query)
            tableView.reloadData()
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchFilms(query: searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchFilms(query: "Matrix")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmViewCell
        let film = films[indexPath.row]
        cell.render(film)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            detailViewController.film = films[selectedIndexPath.row]
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}
