//
//  RepoListNetworkingProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

protocol RepoListNetworkingProtocol {
    func fetchRepos(for username: String, completion: @escaping (_ response: [Repository]?, _ errorMessage: ErrorMessage?) -> Void)
}
