//
//  PreviewViewController2.swift
//  PlusPlusApp
//
//  Created by Izzy Rael on 2/15/16.
//  Copyright © 2016 Team PlusPlus. All rights reserved.
//

import UIKit

class PreviewViewController2: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    init(image: UIImage)
    {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }


}
