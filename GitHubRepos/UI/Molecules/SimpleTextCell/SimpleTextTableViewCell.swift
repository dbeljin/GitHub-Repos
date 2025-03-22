//
//  SimpleTextTableViewCell.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

class SimpleTextTableViewCell: UITableViewCell {

    @IBOutlet private weak var simpleTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(using viewModel: SimpleTextCellProtocol) {
        simpleTextLabel.text = viewModel.text
        simpleTextLabel.font = viewModel.font
        simpleTextLabel.textColor = viewModel.color
    }
    
}
