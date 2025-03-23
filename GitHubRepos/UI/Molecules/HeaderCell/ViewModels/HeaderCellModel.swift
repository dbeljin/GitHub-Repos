//
//  HeaderCellModel.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 23.3.25..
//

class HeaderCellModel: HeaderCellProtocol {
    var avatarUrl: String
    var name: String
    var repoName: String
    var forksCount: String
    var watchersCount: String
    
    init(with repo: Repository) {
        avatarUrl = repo.getAvatarURL().orEmpty
        name = repo.getUsername()
        repoName = repo.name
        forksCount = "\(repo.forksCount ?? 0)"
        watchersCount = "\(repo.watchersCount ?? 0)"
    }
}
