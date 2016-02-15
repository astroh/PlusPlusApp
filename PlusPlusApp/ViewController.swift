//
//  ViewController.swift
//  Camera
//
//  Created by Izzy Rael on 2/9/16.
//  Copyright © 2016 Izzy Rael. All rights reserved.
//

import UIKit
//using my newest laotop-azusa
//liya test

class ViewController: UIViewController{
    
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = ViewController1(nibName: "ViewController1", bundle: nil) // creating instance of view controller 1 (object)
        self.addChildViewController(vc1) // adding as child view to view controller
        self.scrollView.addSubview(vc1.view) // adding view to scroll view
        vc1.didMoveToParentViewController(self)
        
        
        let vc2 = ViewController2(nibName: "ViewController2", bundle: nil)
        var frame2 = vc2.view.frame
        frame2.origin.x = self.view.frame.size.width
        vc2.view.frame = frame2
        
        self.addChildViewController(vc2)
        self.scrollView.addSubview(vc2.view)
        vc2.didMoveToParentViewController(self)
        
        
        let vc3 = ViewController3(nibName: "ViewController3", bundle: nil)
        var frame3 = vc3.view.frame
        frame3.origin.x = self.view.frame.size.width*2
        vc3.view.frame = frame3
        
        self.addChildViewController(vc3)
        self.scrollView.addSubview(vc3.view)
        vc3.didMoveToParentViewController(self)
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height)
    }

}




