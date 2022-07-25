//
//  HomeTableViewCell.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 25/07/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameDescLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        configureViews()
    }
    
    private func configureViews() {
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        nameDescLabel.textColor = .black
        nameDescLabel.font = UIFont.systemFont(ofSize: 14)
        
        dateLabel.textColor = .black
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        
        dataImage.clipsToBounds = true
        dataImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(withModel model: NasaDataModel) {
        nameLabel.text = model.title
        nameDescLabel.text = model.photographer
        dateLabel.text = model.date
        dataImage.loadFrom(URLAddress: model.image)
    }
}
