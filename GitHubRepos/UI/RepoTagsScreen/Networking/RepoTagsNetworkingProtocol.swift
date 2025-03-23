//
//  RepoTagsNetworkingProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

protocol RepoTagsNetworkingProtocol {
    func fetchTags(for username: String, with repositoryName: String, completion: @escaping (_ tags: [Tag]?, _ errorMessage: ErrorMessage?) -> Void)
}
