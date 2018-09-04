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
        let task = UIImage.get(url: URL(string: model.url)!) { [weak self] (result:Result<UIImage>) in
            guard let ws = self else { return }
            switch result {
            case .success(let image):
                ws.imageView.image = image
                print("success")
            case .error:
                print("fail")
            }
        }
    }
}
