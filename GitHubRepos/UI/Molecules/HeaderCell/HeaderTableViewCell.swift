//
//  HeaderTableViewCell.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 23.3.25..
//

import UIKit
import Kingfisher

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var repoNameLabel: UILabel!
    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 15
    }
    
    public func configure(with repo: HeaderCellProtocol) {
        avatarImageView.kf.setImage(with: URL(string: repo.avatarUrl))
        nameLabel.text = repo.name
        repoNameLabel.text = repo.repoName
        watchersLabel.text = repo.watchersCount
        forksLabel.text = repo.forksCount
    }
}
