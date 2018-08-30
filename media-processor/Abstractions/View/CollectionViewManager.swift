//
//  CollectionDataProvider.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-29.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import UIKit
protocol CollectionViewDataManager {
    associatedtype T
    associatedtype Cell:Configurable
    var models:[[T]] {get set}
}


public class CollectionViewManager<T, Cell:UICollectionViewCell> :
    NSObject, CollectionViewDataManager, UICollectionViewDataSource, UICollectionViewDelegate
    where Cell:Configurable, Cell.T == T
{
    var models: [[T]]
    let collectionView:UICollectionView
    
    public init(collectionView:UICollectionView, models:[[T]]) {
        self.collectionView = collectionView
        self.models = models
        super.init()
        initialize()
    }
    
    private func initialize() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = models[safe: section] else { return 0 }
        return section.count
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.Identifier, for: indexPath) as? Cell else {
            fatalError("Expected compile-time-resolved type \(String(describing: Cell.self))")
        }
        cell.configure(model: models[indexPath.section][indexPath.row])
        return cell
    }
    
    
    
    
}
