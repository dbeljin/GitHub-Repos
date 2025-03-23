//
//  RepoTagsNetworking.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

class RepoTagsNetworking: RepoTagsNetworkingProtocol {
    func fetchTags(for username: String, with repositoryName: String, completion: @escaping ([Tag]?, ErrorMessage?) -> Void) {
        let formattedUrl = getReposUrl(for: username, with: repositoryName)
        ApiRequest.request(fromUrl: formattedUrl, httpMethod: ApiRequest.GET, outType: [Tag].self) { tags, errorMessage in
            completion(tags, errorMessage)
        }
    }
    
    private func getReposUrl(for username: String, with repositoryName: String) -> String {
        let baseUrl = Constants.getBaseUrl()
        let userRepo = String(format: Constants.repoTagsEndpoint, username, repositoryName)
        return baseUrl + userRepo
    }
}
