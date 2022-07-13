//
//  ActorCollectionViewCell.swift
//  Lesson9_HW
//
//  Created by Иван on 11.07.2022.
//

import UIKit

class ActorCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var containerView: UIView!
    
    func configure() {
        containerView.backgroundColor = .green
        containerView.layer.cornerRadius = 50
    }
}
