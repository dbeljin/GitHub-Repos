//
//  HeaderCellProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 23.3.25..
//

protocol HeaderCellProtocol {
    var avatarUrl: String { get }
    var name: String { get }
    var repoName: String { get }
    var forksCount: String { get }
    var watchersCount: String { get }
}
