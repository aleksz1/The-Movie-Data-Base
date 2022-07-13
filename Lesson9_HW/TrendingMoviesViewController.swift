import UIKit
import RealmSwift

class TrendingMoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var moviesList: [Movie] = []
    var serialsList: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let movieCellNib = UINib(nibName: "TrendingMovieTableViewCell", bundle: nil)
        tableView.register(movieCellNib, forCellReuseIdentifier: "TrendingMovieTableViewCell")
        self.collectionView.register(UINib(nibName: "ActorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ActorCollectionViewCell")
        NetworkManager.shared.reguestTrendingMovies(completion: { moviesList in
        self.moviesList = moviesList
        self.tableView.reloadData()
        })
        self.title = "Movies list"
//        NetworkManager.shared.reguestTrendingSerials(completion: {serialsList in
//        self.serialsList = serialsList
//        })
    }
    
    @IBAction func segmentControllAction(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex
          {
          case 0:
            NetworkManager.shared.reguestTrendingMovies(completion: { moviesList in
            self.moviesList = moviesList
            self.tableView.reloadData()
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
extension TrendingMoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorCollectionViewCell", for: indexPath) as? ActorCollectionViewCell {
            cell.configure()
            return cell
        }
        return UICollectionViewCell()
    }
}
