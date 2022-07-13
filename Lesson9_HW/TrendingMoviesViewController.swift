import UIKit
import RealmSwift

class TrendingMoviesViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var actorCollectionView: UICollectionView!
    @IBOutlet weak var filmsCollectionView: UICollectionView!
    
    var moviesList: [Movie] = []
    var serialsList: [Movie] = []
    var personList: [Actor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.actorCollectionView.register(UINib(nibName: "ActorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ActorCollectionViewCell")
        self.filmsCollectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        NetworkManager.shared.reguestTrendingMovies(completion: { moviesList in
        self.moviesList = moviesList
        self.filmsCollectionView.reloadData()
        })
        NetworkManager.shared.reguestTrendingSerials(completion: {serialsList in
        self.serialsList = serialsList
        })
        NetworkManager.shared.reguestTrendingPerson(completion: {personsList in
        self.personList = personsList
        self.actorCollectionView.reloadData()
        })
        self.title = "Movies list"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NetworkManager.shared.reguestTrendingPerson(completion: {personsList in
            self.personList = personsList
            self.actorCollectionView.reloadData()
        })
    }
    
    @IBAction func segmentControllAction(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex
          {
          case 0:
            NetworkManager.shared.reguestTrendingMovies(completion: { moviesList in
            self.moviesList = moviesList
            self.filmsCollectionView.reloadData()
            })
          case 1:
            NetworkManager.shared.reguestTrendingSerials(completion: {serialsList in
            self.moviesList = serialsList
            self.filmsCollectionView.reloadData()
            })
          default:
              print("Error")
          }
    }
}

extension TrendingMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if (collectionView == filmsCollectionView) {
        return moviesList.count
        }
        return personList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellActor = actorCollectionView.dequeueReusableCell(withReuseIdentifier: "ActorCollectionViewCell", for: indexPath) as! ActorCollectionViewCell
        cellActor.configureWith(personList[indexPath.row])
        if (collectionView == filmsCollectionView) {
            let cellFilms = filmsCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            cellFilms.configureWith(moviesList[indexPath.row])
            return cellFilms
        }
        return cellActor
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
        detailsViewController.movie = movie
        navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
