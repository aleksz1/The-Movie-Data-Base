import UIKit
import RealmSwift

class WatchLaterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [MovieRealm] = []
    let realm = try? Realm()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.movies = self.getMovies()
        tableView.reloadData()
    }
    
    func getMovies() -> [MovieRealm] {

        var movies = [MovieRealm]()
        guard let filmsResults = realm?.objects(MovieRealm.self) else {return [] }
        for movie in filmsResults {
            movies.append(movie)
        }
        return movies
    }
}


extension WatchLaterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
}
