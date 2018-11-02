//
//  CollectionDataProvider.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-29.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import UIKit
protocol CollectionViewDataManager {
    associatedtype ModelType
    associatedtype CellType:Configurable
    var models:[[ModelType]] {get set}
}

protocol CollectionViewManagerActivityDelegate:class {
    func fetchResource(indexPath:IndexPath)
    func didSelectItemAtIndexPath(indexPath:IndexPath)
}

public class CollectionViewManager<ModelType, CellType:UICollectionViewCell> :
    NSObject,
    CollectionViewDataManager,
    UICollectionViewDataSource,
    UICollectionViewDelegate
    where CellType:Configurable, CellType.ModelType == ModelType
{
    weak var delegate:CollectionViewManagerActivityDelegate?
    var models: [[ModelType]] {
        didSet {
            collectionView.reloadData()
        }
    }
    let collectionView:UICollectionView
    
    public init(collectionView:UICollectionView, models:[[ModelType]] = [[ModelType]]()) {
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.Identifier, for: indexPath) as? CellType else {
            fatalError("Expected compile-time-resolved type \(String(describing: CellType.self))")
        }
        guard let model = models[safe: indexPath.section]![safe: indexPath.row] else {
            fatalError("Invalid cell index")
        }
        cell.configure(model: model)
        delegate?.fetchResource(indexPath: indexPath)
        return cell
    }
    
    func cellForItem(indexPath:IndexPath) -> CellType? {
        return collectionView.cellForItem(at: indexPath) as? CellType
    }
    
    func visibleCellForItem(indexPath:IndexPath) -> CellType? {
        if collectionView.indexPathsForVisibleItems.contains(indexPath) {
            return collectionView.cellForItem(at: indexPath) as? CellType
        }
        return nil
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemAtIndexPath(indexPath: indexPath)
    }
    
    
    
    
}
