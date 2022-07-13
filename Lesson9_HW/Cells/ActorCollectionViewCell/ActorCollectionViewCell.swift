//
//  ActorCollectionViewCell.swift
//  Lesson9_HW
//
//  Created by Иван on 11.07.2022.
//

import UIKit
import SDWebImage

class ActorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var actorImageView: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    func configureWith(_ item: Actor) {
        containerView.layer.cornerRadius = 20
        actorImageView.layer.cornerRadius = 20
        actorName.text = item.name ?? "No title"
        var imageUrlString = ""
        if let backdropPath = item.profilePath{
            imageUrlString = "https://image.tmdb.org/t/p/w500/" + backdropPath
            let imageURL = URL(string: imageUrlString)
            actorImageView.sd_setImage(with: imageURL, completed: nil)
        }
    }
}

