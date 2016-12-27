//
//  DefaultTimingFucViewController.swift
//  YFPPOPDemo
//
//  Created by Charles Yao on 2016/12/26.
//  Copyright © 2016年 Charles Yao. All rights reserved.
//

import UIKit

class DefaultTimingFucViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    
    var redViewOriginalFrame: CGRect!
    var redViewAnimationFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.redViewOriginalFrame = self.redView.frame
        self.redViewAnimationFrame = CGRect(x: self.redView.frame.origin.x, y: self.view.frame.size.height - self.redView.frame.size.height , width: self.redView.frame.size.width, height: self.redView.frame.size.height)
    }
    
    @IBAction func startAnimation(_ sender: UIButton) {
        var animationToFrame: CGRect!
        if self.redView.frame.equalTo(self.redViewOriginalFrame) {
            animationToFrame = self.redViewAnimationFrame
        }else {
            animationToFrame = self.redViewOriginalFrame
        }
        
        let ani = POPBasicAnimation(propertyNamed: kPOPViewFrame)
        ani?.duration = 0.5
        ani?.fromValue = self.redView.frame;
        ani?.toValue = animationToFrame
        ani?.timingFunction = CAMediaTimingFunction(name: self.title!)
        self.redView.pop_add(ani, forKey: nil)
    }

}
