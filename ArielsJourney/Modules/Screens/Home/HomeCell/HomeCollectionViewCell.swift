//
//  HomeCollectionViewCell.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private enum Fonts {
        static let title = UIFont(name: "Macondo-Regular", size: 14)
    }
    
    var dataCell: HomeEnum? {
        didSet {
            configureDateCell()
        }
    }
    var isActive: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configureDateCell() {
        if let dateEnum = self.dataCell {
            let dateModel = dateEnum.homeModel
            self.imageView.image = UIImage(named: dateModel.imageName)
            self.titleLabel.text = dateModel.title
            self.titleLabel.font = Fonts.title
            self.titleLabel.textColor = UIColor(named: "ArielDark")
            self.imageView.layer.opacity = isActive ? 1.0 : 0.5
            self.titleContainer.layer.opacity = isActive ? 1.0 : 0.5        }
    }
}
