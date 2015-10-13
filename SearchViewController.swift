//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Randy on 10/9/15.
//  Copyright © 2015 RandyMako. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      feedScrollView.contentSize = feedView.image!.size
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        
        loadingImage.image = animatedImage
        
    }
    
    override func viewDidAppear(animated: Bool) {
        loadingImage.alpha = 1
        feedScrollView.alpha = 0
        delay(2.5) { () -> () in
            self.loadingImage.alpha = 0
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.feedScrollView.alpha = 1
            })
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        
        
          }
    

}
