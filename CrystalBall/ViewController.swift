//
//  ViewController.swift
//  CrystalBall
//
//  Created by Michael Reining on 12/30/14.
//  Copyright (c) 2014 Mike Reining. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
     
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    let crystalBall: CrystalBall = CrystalBall()
    
    var soundEffectID: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var backgroundImageArray = [UIImage]()
        for imageNumber in 1...60 {
            if imageNumber < 10 {
                backgroundImageArray.append(UIImage(named: "CB0000\(imageNumber)")!)
            } else {
                backgroundImageArray.append(UIImage(named: "CB000\(imageNumber)")!)
            }
        }
        
        backgroundImageView.animationImages = backgroundImageArray
        backgroundImageView.animationDuration = 2.0
        backgroundImageView.animationRepeatCount = 1
        backgroundImageView.startAnimating()
    

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Touch Events
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        NSLog("Touch began")
        self.predictionLabel.text = nil
        self.predictionLabel.alpha = 0.0
        playSoundEffect()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        NSLog("Touch ended")
        makePrediction()

    }
    
    //MARK: Motion Events
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent) {
        NSLog("Motion began")
        self.predictionLabel.text = nil
        self.predictionLabel.alpha = 0.0
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        NSLog("Motion ended")
        makePrediction()
    }
    
    
    //MARK: Functions
    
    func makePrediction() {
        backgroundImageView.startAnimating()
        self.predictionLabel.text = self.crystalBall.randomPrediction()
        
        // Fade in Animation is better thank dispatch delay since it looks smoother vs. just having item instantly appear after x second delay
        UIView.animateWithDuration(5.0, delay: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.predictionLabel.alpha = 1.0
            }, completion: nil)
//        delay(2.0) {
//            self.predictionLabel.alpha = 1.0
//        }
        
    }
    
    func playSoundEffect() {
        if soundEffectID == 0 {
            let soundURL = NSBundle.mainBundle().URLForResource("crystal_ball", withExtension: "mp3")!
            AudioServicesCreateSystemSoundID(soundURL, &soundEffectID)
        }
        AudioServicesPlaySystemSound(soundEffectID)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}

