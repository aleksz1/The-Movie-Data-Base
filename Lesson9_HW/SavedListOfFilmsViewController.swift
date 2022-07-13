//
//  SavedListOfFilmsViewController.swift
//  Lesson9_HW
//
//  Created by Иван on 11.07.2022.
//

import UIKit
import RealmSwift

class SavedListOfFilmsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let realm = try? Realm()
    
    var arrayList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func display() {
        
        let movies = self.getMovies()
        
        for (index, item) in movies.enumerated() {
            let indexString = String(describing: index + 1)
            print(indexString + " " + item.title)
            print()
        }
    }
    
    func getMovies() -> [MovieRealm] {
        
        var movies = [MovieRealm]()
        guard let moviesResults = realm?.objects(MovieRealm.self) else { return[] }
        for movie in moviesResults {
            movies.append(movie)
        }

        return movies
    }
}

extension SavedListOfFilmsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! UITableViewCell
        return cell
    }
}

