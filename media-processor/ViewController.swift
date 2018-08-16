//
//  ViewController.swift
//  SampleCode
//
//  Created by Alex Maslov on 2018-08-12.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let c = CollectionViewController<CollectionViewCell<Image>,Image>()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

