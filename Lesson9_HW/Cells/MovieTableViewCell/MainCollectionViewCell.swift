//
//  MainCollectionViewCell.swift
//  Lesson9_HW
//
//  Created by Иван on 13.07.2022.
//

import UIKit
import SDWebImage


class MainCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var containerViewCell: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerViewCell.layer.cornerRadius = 30
        posterImageView.layer.cornerRadius = 30
    }
    
    func configureWith(_ item: Movie) {
        
        textLabel.text = item.title ?? item.originalName
        var imageUrlString = ""
        if let backdropPath = item.backdropPath{
            imageUrlString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageUrlString)
            posterImageView.sd_setImage(with: imageURL, completed: nil)
        }
    }
}
