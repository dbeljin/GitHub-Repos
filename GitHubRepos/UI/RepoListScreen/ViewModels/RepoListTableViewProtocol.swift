//
//  RepoListTableViewProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

protocol RepoListTableViewProtocol: DefaultTableViewProtocol {
    var uiObserver: RepoListUIObserver? { get set }
    var networking: RepoListNetworkingProtocol { get }
    func retryFetching()
}
