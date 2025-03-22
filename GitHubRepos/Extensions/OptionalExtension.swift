//
//  OptionalExtension.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

extension Optional where Wrapped: Collection {
    public var orEmpty: any Collection {
        switch self {
        case .some(let collection):
            return collection
        case .none:
            return []
        }
    }
}

extension Optional where Wrapped == String {
    public var orEmpty: String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return ""
        }
    }
}
