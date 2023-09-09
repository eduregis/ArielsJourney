//
//  AnimateView.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 09/09/23.
//

import UIKit

extension UIView {
    func growAndShrink() {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0, 1.1, 1.0]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 0.5
        animation.repeatCount = .zero
        self.layer.add(animation, forKey: nil)
    }
}
