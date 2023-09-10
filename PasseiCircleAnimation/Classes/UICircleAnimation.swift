//
//  File.swift
//
//
//  Created by Vagner Oliveira on 11/01/23.
//

import Foundation
import UIKit

public class UICircleAnimation:UIView {
    
    let containerView = UIView()
    
    public var shadowProperties:ZMShadowProperties = .init(backgroundColor: UIColor.clear.cgColor, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 1.0), shadowOpacity: 0.6, shadowRadius: 4.0)
 
    
    public var gradientLayer: CAGradientLayer?
 
    public var gradientBorderColor:[CGColor] = [ UIColor.blue.cgColor,UIColor.red.cgColor ]
  
    /**
     *  Variables
     */
    
    /// - Initial angle
    public var startAngle:UIStartAngle = UIStartAngle.bottom
   
    /// - Circle properties colors
    public var circleProperties:UICircleProperties = UICircleProperties(backgroundColor: UIColor(red: 251/255, green: 221/255, blue: 221/255, alpha: 1), circleColor: UIColor(red: 236/255, green: 87/255, blue: 87/255, alpha: 1))
    
    /// - Total percent
    public var percent:Double = 100
    
    /// - Initial value text
    private var initialValue:Double = 0
    
    /// - Animation duration
    public var animationDuration:CFTimeInterval = 0.4
 
    // - Size of stroke
    public var lineWidth:CGFloat = 10
    
    /// - View wrapper, size equal this view
    private(set) var wrapperView:UIView!
 
    /// - Total perncent
    public var percentLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    /// - Calc of circle position
    private lazy var circleWidth:CGFloat = {
        return CGFloat(percent) / self.lineWidth
    }()
    
    /// - Start time animation text
    private var timer:Timer!
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = bounds
        gradientLayer?.cornerRadius = bounds.width / 2.0
  
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(wrapperView:UIView,gradientLayer:CAGradientLayer? = nil) {
        self.init(frame: .zero)
        
        self.wrapperView = wrapperView
        self.gradientLayer = gradientLayer

        addSubViews()
        addConstraints()
    }
    
    private func addSubViews() {
        self.wrapperView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(percentLabel)
        layer.backgroundColor = shadowProperties.backgroundColor
        layer.shadowColor = shadowProperties.shadowColor
        layer.shadowOffset = shadowProperties.shadowOffset
        layer.shadowOpacity = shadowProperties.shadowOpacity
        layer.shadowRadius = shadowProperties.shadowRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
    }
    
    /// - Add constraint to percent text
    private func addConstraints() {
        NSLayoutConstraint.activate([
            percentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            wrapperView.topAnchor.constraint(equalTo: topAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: trailingAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
           
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// - Animation text while initialValue <= percent
    @objc private func timerFunc() {
        initialValue += 1
        if initialValue <= percent {
            percentLabel.text = "\(initialValue)%"
        } else {
            timer.invalidate()
            timer = nil
        }
    }
    
    /// - Set wrapperView, default 100x100
    public func setView(wrapperView:UIView) {
        self.wrapperView = wrapperView
    }
    
    /// - Start code here
    public func start() {
        

        
        self.addPropertiesSuperView()
        self.circleAnimation()
        self.textAnimation()
    }
    
    /// - Call timer
    private func textAnimation() {
        self.timer = Timer.scheduledTimer(timeInterval: self.animationDuration / self.percent, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
    }
    
    /// - Add from superview
    private func addPropertiesSuperView() {
       if let gradientLayer = gradientLayer {
           layer.insertSublayer(gradientLayer, at: 0)
        } else {
           backgroundColor = circleProperties.backgroundColor
        }

        containerView.bounds = self.wrapperView.bounds
        layer.cornerRadius = (self.wrapperView.frame.width) / 2
        
        
    }
    
    /// - Start circle animation
    private func circleAnimation() {
        
        let radius = (self.wrapperView.frame.width) / 2
        
        let center = CGPoint(x: self.wrapperView.frame.width / 2, y: self.wrapperView.frame.height / 2)
        print(self.wrapperView.center)
        
        var calcPi = 0.0
        switch startAngle {
        case.right:
            calcPi = (CGFloat.pi * 2) * percent / 100
            break
        case.top:
            calcPi = (-CGFloat.pi / 2) + (CGFloat.pi * 2 * percent / 100)
            break
        case.left:
            calcPi = CGFloat.pi + (CGFloat.pi  * 2 * percent / 100)
            break
        case.bottom:
            calcPi = ((CGFloat.pi * 2) * percent / 100) + (CGFloat.pi / 2)
            break
        }
        
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle.show  , endAngle: calcPi, clockwise: true)
        
        let zMCustomGradientColor = ZMCustomGradientColor(view: containerView)

        zMCustomGradientColor.addBorderGradient(startColor: UIColor.red, endColor: UIColor.blue, lineWidth: lineWidth, circlePath:circlePath,duration: animationDuration,gradientColors: gradientBorderColor)
 
    }
}


