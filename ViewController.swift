//
//  ViewController.swift
//  Tumblr
//
//  Created by Randy on 10/9/15.
//  Copyright © 2015 RandyMako. All rights reserved.
//  UIViewControllerAnimatedTransitioning

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var exploreNotification: UIImageView!
    
    // Tabs
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var trendingViewController: UIViewController!
    var accountViewController: UIViewController!
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeStoryboard")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchStoryboard")
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("composeStoryboard")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingStoryboard")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountStoryboard")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        
    }
    
    

    @IBAction func didPressTab(sender: UIButton) {
    
        let previousIndex = selectedIndex
        
        selectedIndex = sender.tag
        
        buttons[previousIndex].selected = false
        
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        
        let vc = viewControllers[selectedIndex]
        
        addChildViewController(vc)
        
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMoveToParentViewController(self)
        
        
        if selectedIndex == 1 {
            exploreNotification.hidden = true
        } else {
            exploreNotification.hidden = false
        }
        
        // Bounce the Explore Notification
        UIView.animateWithDuration(1.0, delay: 0, options: [UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat], animations: { () -> Void in
            self.exploreNotification.transform = CGAffineTransformMakeTranslation(0, -10)
            }, completion: nil)
        
        
    }

}

