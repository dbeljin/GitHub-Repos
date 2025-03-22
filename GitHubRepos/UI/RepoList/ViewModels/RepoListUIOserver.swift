//
//  RepoListUIObserver.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

protocol RepoListUIObserver: AnyObject {
    func setTitle(_ title: String)
    func showAlert(title: String, description: String)
    func reloadData()
    func openRepo(_ repo: Repository)
}
