//
//  SpringAnimationViewController.swift
//  YFPPOPDemo
//
//  Created by Charles Yao on 2016/12/26.
//  Copyright © 2016年 Charles Yao. All rights reserved.
//

import UIKit

class SpringAnimationViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    var redViewOrignalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.redViewOrignalCenter = self.redView.center
    }
    
    @IBAction func startAnimation(_ sender: UIButton) {
        let ani = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        if self.redView.center.y .isEqual(to: self.redViewOrignalCenter.y) {
            ani?.toValue = NSValue(cgPoint: CGPoint(x: g_screenSize.width*0.5, y: g_screenSize.height - self.redView.frame.size.height))
        }else {
            ani?.toValue = NSValue(cgPoint:self.redViewOrignalCenter)
        }
        
    /*
        1.springBounciness 弹簧弹力 取值范围为[0, 20]，默认值为4
        2.springSpeed 弹簧速度，速度越快，动画时间越短 [0, 20]，默认为12，和springBounciness一起决定着弹簧动画的效果
        3.dynamicsTension 弹簧的张力
        4.dynamicsFriction 弹簧摩擦
        5.dynamicsMass 质量 。张力，摩擦，质量这三者可以从更细的粒度上替代springBounciness和springSpeed控制弹簧动画的效果
    */
        ani?.springSpeed = 20
        ani?.springBounciness = 20//弹性
        ani?.dynamicsMass = 1
        self.redView.pop_add(ani, forKey: "")
        
    }
}
