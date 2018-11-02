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
    func displayError(error:Error)
}

class ListViewModel:CollectionViewManagerActivityDelegate {
    
    var delegate:ListViewModelDelegate?
    let collectionViewManager:CollectionViewManager<Image,ImageCell>
    let mediaListFetcher = MediaService()
    var images = [[UIImage]]()
    var isDownloading = false
    
    init(collectionView:UICollectionView) {
        collectionViewManager = CollectionViewManager<Image,ImageCell>(collectionView: collectionView)
        collectionViewManager.delegate = self
        initialize()
    }
    
    
    private func initialize() {
    }
    
    func fetchResource(indexPath: IndexPath) {
        if let image = image(forIndex: indexPath) {
            guard let cell = collectionViewManager.cellForItem(indexPath: indexPath) else {return}
            cell.imageView.image = image
        }
    }
    
    func didSelectItemAtIndexPath(indexPath: IndexPath) {
        
    }
    
    func getImageModels(forceDownload:Bool = false) {
        if (collectionViewManager.models.count == 0 && isDownloading == false) || forceDownload == true {
            mediaListFetcher.get(request: AppRequests.mediaList) { [weak self] (result:Result<[Image]>) in
                guard let ws = self else {return}
                switch result {
                case .success(let images):
                    //ws.delegate?.didRecieveMediaList(imageModels: [images])
                    ws.collectionViewManager.models = [images]
                case .error(let error):
                    ws.delegate?.displayError(error: error)
                }
            }
        }
    }
    
    func image(forIndex indexPath:IndexPath) -> UIImage? {
        if let image = images[indexPath: indexPath] {
            return image
        }
        guard let model = collectionViewManager.models[indexPath: indexPath] else {return nil}
        let _ = UIImage.get(url: URL(string: model.url)!) { [weak self] (result:Result<UIImage>) in
            guard let ws = self else { return }
            switch result {
            case .success(let image):
                guard let cell = ws.collectionViewManager.visibleCellForItem(indexPath: indexPath) else {return}
                cell.imageView.image = image
                print("success")
            case .error(let error):
                ws.delegate?.displayError(error: error)
                print("fail")
            }
        }
        return nil
    }
}
