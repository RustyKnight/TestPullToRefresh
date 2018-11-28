//
//  RefreshView.swift
//  TestPullToRefresh
//
//  Created by Shane Whitehead on 28/11/18.
//  Copyright © 2018 Kaizen Enteripises. All rights reserved.
//

import UIKit

class RefreshView: UIView {
//  override open class var layerClass: AnyClass {
//    return CAGradientLayer.classForCoder()
//  }

  var gradientLayer: CAGradientLayer = {
    // A Basic Implementation
    print("Make")
    let gradient = CAGradientLayer()
    gradient.colors = [
      UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.red.cgColor,
    ]
    gradient.startPoint = CGPoint(x:0, y:0)
    gradient.endPoint = CGPoint(x:1, y:0)
    gradient.locations = [0, 0.5, 1]

    return gradient
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    print("...")
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    layer.insertSublayer(gradientLayer, at: 0)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = bounds
  }

  func stopAnimating() {
    print("stop")
    gradientLayer.removeAnimation(forKey: "colors")
  }

  func startAnimating() {
    print("start")
    let gradientChangeAnimation = CABasicAnimation(keyPath: "locations")
    gradientChangeAnimation.duration = 5.0
    gradientChangeAnimation.fromValue = [-0.5, 0, 0.5]
    gradientChangeAnimation.toValue = [0.5, 1, 1.5]
    gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
    gradientChangeAnimation.repeatDuration = 5.0
    gradientChangeAnimation.delegate = self
    gradientChangeAnimation.isRemovedOnCompletion = false
    gradientLayer.add(gradientChangeAnimation, forKey: "colors")
  }

}

extension RefreshView: CAAnimationDelegate {
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    guard flag else {
      return
    }
//    anim.delegate = nil
    stopAnimating()
    startAnimating()
  }
}
