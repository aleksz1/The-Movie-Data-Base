//
//  MovieDetailsViewController.swift
//  Lesson9_HW
//
//  Created by Иван on 05.07.2022.
//

import UIKit
import SDWebImage
import RealmSwift
import youtube_ios_player_helper

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameMovieLabel: UILabel!
    @IBOutlet weak var descriptionMovieLabel: UILabel!
    @IBOutlet weak var ratingMovieLabel: UILabel!
    @IBOutlet weak var releaseMovieLabel: UILabel!
    
    
    var movie: Movie?
    var serial: Movie?
    
    let realm = try? Realm()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFilms()
    }
    
    func loadFilms() {
        var imageUrlString = ""
        if let backdropPath = self.movie?.backdropPath{
            imageUrlString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageUrlString)
        self.posterImageView.sd_setImage(with: imageURL, completed: nil)
    }
        self.nameMovieLabel.text = movie?.title ?? movie?.originalName
        self.descriptionMovieLabel.text = movie?.overview ?? "No overview"
        self.ratingMovieLabel.text = movie?.voteAverage?.description ?? "No overview"
        self.releaseMovieLabel.text = movie?.releaseDate ?? movie?.firstAirDate
    }
    
    @IBAction func addToListButtonPressed(_ sender: Any) {
        let movieRealm = MovieRealm()

        movieRealm.title = self.movie?.title ?? ""
        movieRealm.popularity = self.movie?.popularity ?? 0.0
        movieRealm.overview = self.movie?.overview ?? ""
        movieRealm.id = self.movie?.id ?? 0
        movieRealm.backdropPath = self.movie?.backdropPath ?? ""
        movieRealm.mediaType = self.movie?.mediaType ?? ""
        movieRealm.posterPath = self.movie?.posterPath ?? ""

        try? realm?.write {
            realm?.add(movieRealm)
        }

        let alert = UIAlertController(title: "Attention", message: "Saved", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
             }))
        self.present(alert, animated: true, completion: nil)
    }
}
