//
//  ErrorMessage.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

public struct ErrorMessage {
    let title: String
    let body: String
    
    public init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
    public static func getDefaultError() -> ErrorMessage {
        ErrorMessage(title: String(localized: "ErrorTitle"), body: String(localized: "ErrorMessage"))
    }
    
    public static func getDefaultError(with description: String?) -> ErrorMessage {
        ErrorMessage(title: String(localized: "ErrorTitle"), body: description ?? String(localized: "ErrorMessage"))
    }
}
