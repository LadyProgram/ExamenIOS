//
//  FilmViewCell.swift
//  ExamenIOS
//
//  Created by Mañanas on 17/6/25.
//

import UIKit

class FilmViewCell: UITableViewCell {
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var titleLabel: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    func render(_ film: Film) {
        titleLabel.text = film.Title
        dateLabel.text = film.Year
        posterView.loadFrom(url: film.Poster)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
