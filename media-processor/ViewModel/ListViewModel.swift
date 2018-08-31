//
//  ListViewModel.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-30.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewModelDelegate {
    func didRecieveMediaList(imageModels:[[Image]])
    func displayError(error:Error)
}

class ListViewModel {
    
    var delegate:ListViewModelDelegate?
    let collectionViewManager:CollectionViewManager<Image,ImageCell>
    let mediaListFetcher = MediaService()
    var imageModels:[[Image]]?
    var isDownloading = false
    
    init(collectionView:UICollectionView) {
        collectionViewManager = CollectionViewManager<Image,ImageCell>(collectionView: collectionView)
        initialize()
    }
    
    private func initialize() {
        imageModels = getImageModels()
    }
    
    func getImageModels(forceDownload:Bool = false) -> [[Image]]? {
        if (imageModels == nil && isDownloading == false) || forceDownload == true {
            mediaListFetcher.get(request: AppRequests.mediaList) { [weak self] (result:Result<[Image]>) in
                guard let ws = self else {return}
                switch result {
                case .success(let images):
                    ws.imageModels = [images]
                    ws.delegate?.didRecieveMediaList(imageModels: [images])
                case .error(let error):
                    ws.delegate?.displayError(error: error)
                }
            }
            return nil
        }
        else {
            return imageModels
        }
    }
}
