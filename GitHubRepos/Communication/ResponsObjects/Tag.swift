//
//  Tag.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

struct Tag: Codable {
    let name: String
    let commit: TagsCommit
    
    public func getSha() -> String {
        commit.sha
    }
}
