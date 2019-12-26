//
//  ViewController.swift
//  PropertyAnimators
//
//  Created by Jules Lee on 12/27/19.
//  Copyright © 2019 Jules Lee. All rights reserved.
//

/*
 
 UIView Property Animators Advantges include being:
 
 - Dynamic Animations
 
 - Interuptible
 
 - Scribbale
 
 - Reversible
 
 - More Timing Functions
 
 */

import UIKit

class ViewController: UIViewController {
    var animator: UIViewPropertyAnimator!
    @IBOutlet weak var block: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupAnimation()
    }

    func setupAnimation() {
        animator = UIViewPropertyAnimator(duration: 1.2, curve: .linear, animations: {
            let screenWidth = self.view.frame.size.width
            let blockWidth = self.block.frame.size.width
            
            self.block.frame.origin.x = screenWidth - blockWidth
        })
    }
    
    @IBAction func start(_ sender: UIButton) {
        animator.startAnimation()
    }
}

