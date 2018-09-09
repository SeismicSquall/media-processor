//
//  MainViewController.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-30.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListViewModelDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var listViewModel:ListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listViewModel = ListViewModel(collectionView: collectionView)
        listViewModel.getImageModels()
        
    }
    
    func displayError(error: Error) {
        //TODO: Display Error
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
