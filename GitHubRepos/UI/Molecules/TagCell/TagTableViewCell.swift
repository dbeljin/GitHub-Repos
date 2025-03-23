//
//  TagTableViewCell.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 23.3.25..
//

import UIKit

class TagTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(using viewModel: TagTextCellProtocol) {
        titleLabel.text = viewModel.title
        titleLabel.font = viewModel.titleFont
        titleLabel.textColor = viewModel.titleColor
        
        descriptionLabel.text = viewModel.description
        descriptionLabel.font = viewModel.descriptionFont
        descriptionLabel.textColor = viewModel.descriptionColor
    }
}
