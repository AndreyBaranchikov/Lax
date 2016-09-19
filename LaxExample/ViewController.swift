//
//  ViewController.swift
//  LaxExample
//
//  Created by Andrey Baranchikov on 02/09/2016.
//  Copyright (c) 2016 Keinex. All rights reserved.
//

import UIKit
import Lax

class ViewController: UIViewController {
    
    @IBOutlet weak var LaxView: LaxView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        // Setup the LaxView
        LaxView.viewsToAnimate = exampleViewsForParallax()
        LaxView.strength = .Fast
        
        // LaxView.strengthPoints = 300.0 // Alternative method to set the strength
    }
    
    func exampleViewsForParallax() -> [UIView] {
        
        var exampleViews: [UIView] = []
        
        let imageNames = ["background", "clouds", "hills", "sea"]
        
        for imageName in imageNames {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = UIViewContentMode.scaleAspectFill
            exampleViews.append(imageView)
        }
        
        return exampleViews
    }
    
    override func didReceiveMemoryWarning() {
        LaxView.viewsToAnimate = []
    }
    
    func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        // Calculate the other view
        var newFrame = self.view.bounds
        newFrame.size = size
        
        // Update the frame of the views to animate.
        // This is not mandatory. If you want to keep the frame of the views always the same
        for viewToAnimate in LaxView.viewsToAnimate {
            viewToAnimate.frame = newFrame
        }
    }
}

