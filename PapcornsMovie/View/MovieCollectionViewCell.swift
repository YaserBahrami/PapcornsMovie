//
//  MovieCollectionViewCell.swift
//  PapcornsMovie
//
//  Created by yaser on 1/24/20.
//  Copyright © 2020 Bahrami. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    var movieData: DMovie!
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 5.0
        // Initialization code
    }
    
    func setupView(){
        if movieData != nil{
            movieTitleLabel.text = movieData.movieTitle
            movieImage.downloaded(from: movieData.movieImage)
            movieGenreLabel.text = movieData.movieGenre
            movieYearLabel.text = "\(movieData.movieYear!)"
        }
    }

}
