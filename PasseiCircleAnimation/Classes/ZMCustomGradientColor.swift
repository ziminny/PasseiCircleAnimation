//
//  ZMCustomGradientColor.swift
//  TestDependency
//
//  Created by Vagner Oliveira on 14/02/23.
//

import Foundation
import UIKit

internal class ZMCustomGradientColor {
    
    private let view:UIView
    
    public init(view: UIView) {
        self.view = view
    }
    
    public func addBorderGradient(startColor:UIColor, endColor: UIColor, lineWidth: CGFloat, circlePath:UIBezierPath,duration:CGFloat,gradientColors:[Any]) {
        
            view.layer.cornerRadius = view.bounds.size.height / 2.0
            view.clipsToBounds = true
          
            let gradient = CAGradientLayer()
            gradient.removeFromSuperlayer()
    
            gradient.frame = view.bounds
       
            gradient.colors = gradientColors
     
            let shape = CAShapeLayer()
        
            shape.strokeEnd = 0
            shape.lineCap = .round
            shape.lineWidth = lineWidth
            shape.fillColor = UIColor.clear.cgColor
    
     
            shape.path = circlePath.cgPath
     
            shape.strokeColor = UIColor.black.cgColor
        
            gradient.mask = shape
           
         
            view.layer.addSublayer(gradient)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = duration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey: "urSoBasic")
    }
    
}

 

