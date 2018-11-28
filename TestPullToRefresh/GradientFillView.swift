//
//  GradientFillView.swift
//  TestPullToRefresh
//
//  Created by Shane Whitehead on 28/11/18.
//  Copyright © 2018 Kaizen Enteripises. All rights reserved.
//

import UIKit

@IBDesignable class GradientFillView: UIView {
  
  // 1
  @IBInspectable var startColor: UIColor = .red
  @IBInspectable var endColor: UIColor = .green
  
  override func draw(_ rect: CGRect) {
    
    // 2
    let context = UIGraphicsGetCurrentContext()!
    let colors = [startColor.cgColor, endColor.cgColor]
    
    // 3
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    
    // 4
    let colorLocations: [CGFloat] = [0.0, 1.0]
    
    // 5
    let gradient = CGGradient(colorsSpace: colorSpace,
                              colors: colors as CFArray,
                              locations: colorLocations)!
    
    // 6
    let startPoint = CGPoint.zero
    let endPoint = CGPoint(x: 0, y: bounds.height)
    context.drawLinearGradient(gradient,
                               start: startPoint,
                               end: endPoint,
                               options: [])
  }
}
