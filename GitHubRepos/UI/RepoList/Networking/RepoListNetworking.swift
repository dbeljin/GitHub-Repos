//
//  RepoListNetworking.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

class RepoListNetworking: RepoListNetworkingProtocol {
    
    func fetchRepos(for username: String, completion: @escaping ([Repository]?, ErrorMessage?) -> Void) {
        ApiRequest.request(fromUrl: getReposUrl(for: username), httpMethod: ApiRequest.GET, outType: [Repository].self) { repo, errorMessage in
            completion(repo, errorMessage)
        }
    }
    
    private func getReposUrl(for username: String) -> String {
        let baseUrl = Constants.getBaseUrl()
        let userRepo = String(format: Constants.userRepos, username)
        return baseUrl + userRepo
    }
}
