//
//  PlayListCollectionViewCell.swift
//  MyMusicApp
//
//  Created by Lucky on 05/12/22.
//

import UIKit

class PlayListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
}

extension PlayListCollectionViewCell {
    
    private func initialSetup() {
        configureImageView()
    }
    
    private func configureImageView() {
        iconImageView.layer.cornerRadius = 15
    }
}
