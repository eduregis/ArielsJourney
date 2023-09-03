//
//  GradientLayer.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

enum GradientDirection {
    case toRight, toLeft, toBottom, toTop
}

extension UIView {
    
    func setOpecityGradientBackground(color: UIColor, direction: GradientDirection) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color.withAlphaComponent(1.0).cgColor,
                                color.withAlphaComponent(0.0).cgColor]
        gradientLayer.frame = bounds
        switch direction {
        case .toRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .toLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .toBottom:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        case .toTop:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

