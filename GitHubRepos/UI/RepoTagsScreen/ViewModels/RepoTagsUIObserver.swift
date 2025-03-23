//
//  RepoTagsUIObserver.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

protocol RepoTagsUIObserver: AnyObject {
    func setTitle(_ title: String)
    func showAlertAndReturn(title: String, description: String)
    func reloadData()
}
