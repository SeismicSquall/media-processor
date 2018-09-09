//
//  SafeCollection.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-30.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Collection
    where Element: Collection, Index == Int, Element.Index == Int
{
    subscript (indexPath indexPath:IndexPath) -> Element.Element? {
        guard let subcollection = self[safe: indexPath.section] else {return nil}
        let el = subcollection[safe: indexPath.row ]
        return el
 
    }
}
