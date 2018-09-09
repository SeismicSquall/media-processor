//
//  ImageCell.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-30.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell,Configurable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(model: Image) {
        titleLabel.text = model.title
    }
}
