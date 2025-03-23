//
//  TagTextCellModel.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 23.3.25..
//

class TagTextCellModel: TagTextCellProtocol {
    var title: String
    var description: String
    
    init(with tag: Tag) {
        self.title = tag.name
        self.description = tag.getSha()
    }
}
