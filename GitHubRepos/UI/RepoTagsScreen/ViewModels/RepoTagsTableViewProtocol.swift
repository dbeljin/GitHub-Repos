//
//  RepoTagsTableViewProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

protocol RepoTagsTableViewProtocol: DefaultTableViewProtocol {
    var repo: Repository { get }
    var uiObserver: RepoTagsUIObserver? { get set }
    var networking: RepoTagsNetworkingProtocol { get }
}
