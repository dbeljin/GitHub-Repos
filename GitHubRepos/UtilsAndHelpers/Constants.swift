//
//  Constants.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import Foundation

struct Constants {
    //TODO: Improvement for hardCodedUser - In some future phases create screen where user will firstly enter username
    public static let hardCodedUser: String = "octocat"
    private static let baseUrlProduction = "https://api.github.com/"
    public static let userRepos: String = "users/%@/repos"
    static let timeoutInterval: TimeInterval = 20
    
    //If in future we have development/demo/testing environments
    //we can just adopt here base urls based on environment and all api calls will continue working
    public static func getBaseUrl() -> String {
        baseUrlProduction
    }
}
