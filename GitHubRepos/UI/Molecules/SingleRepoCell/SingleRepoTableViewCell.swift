//
//  SingleRepoTableViewCell.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

class SingleRepoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var issuesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
    }

    public func configure(using viewModel: SingleRepoCellProtocol) {
        titleLabel.text = viewModel.title
        titleLabel.font = viewModel.titleFont
        titleLabel.textColor = viewModel.titleColor
        
        descriptionLabel.text = viewModel.description
        descriptionLabel.font = viewModel.descriptionFont
        descriptionLabel.textColor = viewModel.descriptionColor
        descriptionLabel.isHidden = viewModel.description.isEmpty
        
        issuesLabel.text = viewModel.numberOfIssues
        issuesLabel.font = viewModel.numberOfIssuesFont
        issuesLabel.textColor = viewModel.numberOfIssuesColor
    }
    
}
