//
//  DetailViewController.swift
//  ExamenIOS
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    var film: Film!
    
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var plotLabel: UITextView!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.title = film.Title
        
        posterImage.loadFrom(url: film.Poster)
        yearLabel.text = film.Year
        
        searchFilmsById(id: film.imdbID)
        
       
        }
    
    func searchFilmsById(id: String) {
        Task {
            let films = await FilmProvider.findFilmById(id: id)
           film = films
            
            DispatchQueue.main.async {
                [unowned self] in
                
                runtimeLabel.text = film.Runtime
                directorLabel.text = film.Director
                genreLabel.text = film.Genre
                countryLabel.text = film.Country
                plotLabel.text = film.Plot
            }
        }
    }
}
