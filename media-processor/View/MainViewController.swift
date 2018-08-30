//
//  MainViewController.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-30.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionManager:CollectionViewManager<Image,ImageCell>?
    let mediaListFetcher = MediaService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaListFetcher.get(request: AppRequests.mediaList) { [weak self] (result:Result<[Image]>) in
            guard let ws = self else { return }
            switch result {
            case .success(let images):
                print ("got images")
                ws.collectionManager = CollectionViewManager<Image,ImageCell>(collectionView: ws.collectionView, models: [images])
                
            case .error(let error):
                print (error)
            }
 
        }

        // Do any additional setup after loading the view.
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
