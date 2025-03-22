//
//  Repository.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

struct Repository: Codable {
    let id: Int
    let name: String
    let description: String?
    let openIssuesCount: Int?
    let owner: Owner?
    
    public func getUsername() -> String {
        owner?.login ?? ""
    }
    
    public func getAvatarURL() -> String? {
        owner?.avatarUrl
    }
}
