//
//  RPIView.swift
//  SwiftRPI
//
//  Created by YoloHwang on 17/3/28.
//  Copyright © 2017年 Yolo. All rights reserved.
//

import UIKit

class RPIView: UIView {
    
    public var lineWidth: CGFloat    = 4.0
    public var duration: CGFloat     = 5.0
    public var fillColor: UIColor    = UIColor.clear
    public var strokeColor: UIColor  = UIColor.red
    public var colors: [CGColor]     = [UIColor.red.cgColor,UIColor.blue.cgColor]
    public var locations: [NSNumber] = [0.3,0.6]
    
    public func showRoundProgressIndecatorWithParentView(_ parentView: UIView,hasGradient has: Bool ) {
        setupUI(has)
        parentView.addSubview(self)
    }
    
    fileprivate func setupUI(_ hasGradient: Bool) {
        let centerX = self.bounds.size.width * 0.5
        let centerY = self.bounds.size.height * 0.5
        let raduis = centerX - self.lineWidth * 0.5
        
        let path = UIBezierPath.init(arcCenter: CGPoint(x: centerX, y: centerY), radius: raduis, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI * 1.5), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = self.fillColor.cgColor
        shapeLayer.strokeColor = self.strokeColor.cgColor
        shapeLayer.lineWidth = self.lineWidth
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeEnd = 1.0
        
        if hasGradient {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.colors = self.colors
            gradientLayer.locations = self.locations
            gradientLayer.startPoint = CGPoint (x: 0, y: 0)
            gradientLayer.endPoint = CGPoint (x: 1, y: 0)
            gradientLayer.mask = shapeLayer
            
            self.layer.addSublayer(gradientLayer)
        } else {
            self.layer.addSublayer(shapeLayer)
        }
        
        rpiAnimation(shapeLayer)
    }
    
    fileprivate func rpiAnimation(_ layer: CALayer) {
        let animation = CABasicAnimation (keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = CFTimeInterval(self.duration)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        layer.add(animation, forKey: nil)
        
    }

}

