//
//  ZMShadowProperties.swift
//  TestDependency
//
//  Created by Vagner Oliveira on 14/02/23.
//

import Foundation
import UIKit

public class ZMShadowProperties {
    
    let backgroundColor:CGColor
    let shadowColor:CGColor
    let shadowOffset:CGSize
    let shadowOpacity:Float
    let shadowRadius:CGFloat
    
    public init(backgroundColor: CGColor, shadowColor: CGColor, shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
    }
}
