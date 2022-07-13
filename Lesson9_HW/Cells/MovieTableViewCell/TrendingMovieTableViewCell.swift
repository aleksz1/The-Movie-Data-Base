import UIKit
import SDWebImage

class TrendingMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var makeGradientView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        moviePosterImageView.layer.cornerRadius = 16
    }
    
    func configureWith(_ item: Movie) {
        movieTitleLabel.text = item.title
        movieOverviewLabel.text = item.overview
        var imageUrlString = ""
        if let backdropPath = item.backdropPath{
            imageUrlString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageUrlString)
            moviePosterImageView.sd_setImage(with: imageURL, completed: nil)
        }
    }
}

