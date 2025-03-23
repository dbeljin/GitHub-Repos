//
//  SingleRepoCellModel.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

class SingleRepoCellModel: SingleRepoCellProtocol {
    var title: String
    var titleFont: UIFont = .systemFont(ofSize: 17, weight: .bold)
    var titleColor: UIColor = .accent
    
    var description: String
    var descriptionFont: UIFont = .systemFont(ofSize: 14)
    var descriptionColor: UIColor = .systemGray
    
    var numberOfIssues: String = ""
    var numberOfIssuesFont: UIFont = .systemFont(ofSize: 10)
    var numberOfIssuesColor: UIColor = .systemGreen
    
    init(with repo: Repository) {
        title = repo.name
        description = repo.description.orEmpty
        let (formattedString, textColor) = getNumberOfIssuesFormattedTextAndFont(repo.openIssuesCount)
        numberOfIssues = formattedString
        numberOfIssuesColor = textColor
    }
    
    private func getNumberOfIssuesFormattedTextAndFont(_ issues: Int?) -> (String, UIColor) {
        guard let openIssuesCount = issues, openIssuesCount > 0 else {
            return (String(localized: "NoOpenIssues"), .systemGreen)
        }
        return (String.localizedStringWithFormat(NSLocalizedString("OpenIssues", comment: ""), openIssuesCount), .systemRed)
    }
}
