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
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupAnimation()
    }

    func setupAnimation() {
        self.block.transform = .identity
        self.block.frame.origin.x = 0
        
        animator = UIViewPropertyAnimator(duration: 1.2, curve: .linear, animations: {
            let screenWidth = self.view.frame.size.width
            let blockWidth = self.block.frame.size.width
            
            self.block.frame.origin.x = screenWidth - blockWidth
            self.block.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        })
    }
    
    @IBAction func start(_ sender: UIButton) {
        if animator.isRunning {
            return
        }
        
        switch animator.state {
        case .active:
            animator.isReversed = true
            animator.addAnimations {
                self.block.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
            }
            
            animator.startAnimation()
        case .inactive:
            setupAnimation()
            animator.startAnimation()
            break
        case .stopped:
            animator.finishAnimation(at: .end)
            
        @unknown default:
            fatalError()
        }
        
        animator.addCompletion { (pos) in
            self.block.backgroundColor = .red
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        if animator.state == .active {
            animator.pauseAnimation()
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        animator.stopAnimation(true)
    }
    
    @IBAction func sliderDidChange(_ sender: Any) {
        animator.fractionComplete = CGFloat(slider.value) // only available when animation is paused
    }
}

