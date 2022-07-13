import UIKit
import RealmSwift

class TrendingMoviesViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var actorCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filmsCollectionView: UICollectionView!
    
    var moviesList: [Movie] = []
    var serialsList: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let movieCellNib = UINib(nibName: "TrendingMovieTableViewCell", bundle: nil)
        tableView.register(movieCellNib, forCellReuseIdentifier: "TrendingMovieTableViewCell")
        self.actorCollectionView.register(UINib(nibName: "ActorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ActorCollectionViewCell")
        self.filmsCollectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        NetworkManager.shared.reguestTrendingMovies(completion: { moviesList in
        self.moviesList = moviesList
        self.tableView.reloadData()
        self.filmsCollectionView.reloadData()
        })
        self.title = "Movies list"
        NetworkManager.shared.reguestTrendingSerials(completion: {serialsList in
        self.serialsList = serialsList
        })
    }
    
    @IBAction func segmentControllAction(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex
          {
          case 0:
            NetworkManager.shared.reguestTrendingMovies(completion: { moviesList in
            self.moviesList = moviesList
            self.tableView.reloadData()
            self.filmsCollectionView.reloadData()
            })
          case 1:
            NetworkManager.shared.reguestTrendingSerials(completion: {serialsList in
            self.moviesList = serialsList
            self.tableView.reloadData()
            })
          default:
              print("Error")
          }
    }
}

extension TrendingMoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == actorCollectionView) {
            return 10
        }
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellActor = actorCollectionView.dequeueReusableCell(withReuseIdentifier: "ActorCollectionViewCell", for: indexPath) as! ActorCollectionViewCell
        cellActor.configure()
        
        if (collectionView == filmsCollectionView) {
            let cellFilms = filmsCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            cellFilms.configureWith(moviesList[indexPath.row])
            return cellFilms
        }
        
        return cellActor
    }
}



extension TrendingMoviesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingMovieTableViewCell", for: indexPath) as? TrendingMovieTableViewCell {
            cell.configureWith(moviesList[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            detailsViewController.movie = movie
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
