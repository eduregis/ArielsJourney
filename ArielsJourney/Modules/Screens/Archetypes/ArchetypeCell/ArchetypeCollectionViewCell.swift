//
//  ArchetypeCollectionViewCell.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

class ArchetypeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var emptyCard: UIImageView!
    @IBOutlet weak var card: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var archetypeIcon: UIImageView!
    @IBOutlet weak var archetypeEmptyIcon: UIImageView!
    
    private enum Fonts {
        static let title = UIFont(name: "Macondo-Regular", size: 11)
    }
    
    var dataCell: ArchetypeModel? {
        didSet {
            configureDateCell()
        }
    }
    var isActive: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configureDateCell() {
        if let dataCell = self.dataCell {
            archetypeEmptyIcon.image = UIImage(named: "archetypeCard_emptyIcon_\(dataCell.imageName)")
            if isActive {
                card.image = UIImage(named: "archetypeCard_card_\(dataCell.imageName)")
                archetypeIcon.image = UIImage(named: "archetypeCard_icon_\(dataCell.imageName)")
                titleLabel.text = dataCell.archetypeStage
                self.titleLabel.font = Fonts.title
                self.titleLabel.textColor = UIColor(named: "ArielDark")
            }
        }
    }
    
    
}
