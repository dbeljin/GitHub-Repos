//
//  TagTextCellProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 23.3.25..
//
import UIKit

protocol TagTextCellProtocol {
    var title: String { get }
    var titleFont: UIFont { get }
    var titleColor: UIColor { get }
    
    var description: String { get }
    var descriptionFont: UIFont { get }
    var descriptionColor: UIColor { get }
}

//This default implementation exists to support reusability of the cell
//protocol, allowing the cell to be fully customizable if needed.
extension TagTextCellProtocol {
    var titleFont: UIFont {
        return .systemFont(ofSize: 17, weight: .bold)
    }
    var titleColor: UIColor {
        return .accent
    }
    var descriptionFont: UIFont {
        return .systemFont(ofSize: 12, weight: .light)
    }
    var descriptionColor: UIColor {
        return .systemGray
    }
}
