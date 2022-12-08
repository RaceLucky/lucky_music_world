//
//  TextCellTableViewCell.swift
//  MyMusicApp
//
//  Created by Lucky on 05/12/22.
//

import UIKit

class MusicListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension MusicListCell {
    
    private func initialSetUp() {
        configureImage()
    }
    
    private func configureImage() {
        songImageView.layer.cornerRadius = 10
    }
}
