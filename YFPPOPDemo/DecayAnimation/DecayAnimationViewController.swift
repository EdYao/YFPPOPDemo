//
//  DecayAnimationViewController.swift
//  YFPPOPDemo
//
//  Created by Charles Yao on 2016/12/26.
//  Copyright © 2016年 Charles Yao. All rights reserved.
//

import UIKit

class DecayAnimationViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    
    var redViewCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGes = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        self.redView.addGestureRecognizer(panGes)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.redViewCenter = self.redView.center
    }
    
    func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let point = recognizer.translation(in: self.view)
        recognizer.view?.center = CGPoint(x: (recognizer.view?.center.x)! + point.x, y: (recognizer.view?.center.y)! + point.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if recognizer.state == UIGestureRecognizerState.ended {
            let velocity = recognizer.velocity(in:self.view)
            self.addDecayAnimation(velocity: velocity);
        }
    }
    
    func addDecayAnimation(velocity: CGPoint) {
        let anim = POPDecayAnimation(propertyNamed: kPOPLayerPosition)
        anim?.velocity = NSValue(cgPoint: velocity)
        self.redView.pop_add(anim, forKey: "")
    }
    
    @IBAction func resetRedViewCenter(_ sender: UIButton) {
        self.redView.pop_removeAllAnimations()
        self.redView.center = self.redViewCenter
    }
}
