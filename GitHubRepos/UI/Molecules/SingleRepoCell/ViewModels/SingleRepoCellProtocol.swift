//
//  SingleRepoCellProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

protocol SingleRepoCellProtocol {
    var title: String { get set }
    var titleFont: UIFont { get set }
    var titleColor: UIColor { get set }
    
    var description: String { get set }
    var descriptionFont: UIFont { get set }
    var descriptionColor: UIColor { get set }
    
    var numberOfIssues: String { get set }
    var numberOfIssuesFont: UIFont { get set }
    var numberOfIssuesColor: UIColor { get set }
}
