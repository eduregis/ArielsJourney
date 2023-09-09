//
//  CustomSlider.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 09/09/23.
//

// Based in https://gist.github.com/barisuyar/786482be37b3ec14635190e7887f762f

import UIKit

final class CustomSlider: UISlider {

    private let baseLayer = CALayer()
    private let trackLayer = CAGradientLayer()
    var initialPercentage: CGFloat? {
        didSet {
            configureTrackLayer()
        }
    }
    var volumeSliderEnum: VolumeSlidersEnum?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }

    private func setup() {
        clear()
        createBaseLayer()
        createThumbImageView()
        addUserInteractions()
    }

    private func clear() {
        tintColor = .clear
        maximumTrackTintColor = .clear
        backgroundColor = .clear
        thumbTintColor = .clear
    }

    private func createBaseLayer() {
        baseLayer.borderWidth = 1
        baseLayer.borderColor = UIColor(named: "ArielText")?.cgColor
        baseLayer.masksToBounds = true
        baseLayer.backgroundColor = UIColor.clear.cgColor
        baseLayer.frame = .init(x: 0, y: frame.height / 4, width: frame.width, height: frame.height / 2)
        baseLayer.cornerRadius = baseLayer.frame.height / 2
        layer.insertSublayer(baseLayer, at: 0)
    }

    private func configureTrackLayer() {
        guard let fillPercentage = self.initialPercentage else { return }
        trackLayer.backgroundColor = UIColor(named: "ArielText")?.cgColor
        trackLayer.frame = .init(x: 0, y: frame.height / 4, width: fillPercentage * frame.width, height: frame.height / 2)
        trackLayer.cornerRadius = trackLayer.frame.height / 2
        layer.insertSublayer(trackLayer, at: 1)
    }

    private func addUserInteractions() {
        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }

    @objc private func valueChanged(_ sender: CustomSlider) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        let thumbRectA = thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
        trackLayer.frame = .init(x: 0, y: frame.height / 4, width: thumbRectA.midX, height: frame.height / 2)
        CATransaction.commit()
    }

    private func createThumbImageView() {
        let thumbSize = (3 * frame.height) / 4
        let thumbView = ThumbView(frame: .init(x: 0, y: 0, width: thumbSize, height: thumbSize))
        thumbView.layer.cornerRadius = thumbSize / 2
        let thumbSnapshot = thumbView.snapshot
        setThumbImage(thumbSnapshot, for: .normal)
        setThumbImage(thumbSnapshot, for: .highlighted)
        setThumbImage(thumbSnapshot, for: .application)
        setThumbImage(thumbSnapshot, for: .disabled)
        setThumbImage(thumbSnapshot, for: .focused)
        setThumbImage(thumbSnapshot, for: .reserved)
        setThumbImage(thumbSnapshot, for: .selected)
    }
}

final class ThumbView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = UIColor(named: "ArielText")
        let middleView = UIView(frame: .init(x: frame.midX - 6, y: frame.midY - 6, width: 12, height: 12))
        middleView.backgroundColor = .clear
        middleView.layer.cornerRadius = 6
        addSubview(middleView)
    }
}

extension UIView {

    var snapshot: UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let capturedImage = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return capturedImage
    }
}
