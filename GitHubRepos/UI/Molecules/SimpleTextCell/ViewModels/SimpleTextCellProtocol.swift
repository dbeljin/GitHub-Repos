//
//  SimpleTextCellProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

protocol SimpleTextCellProtocol {
    var text: String { get }
    var font: UIFont { get }
    var color: UIColor { get }
}

//This default implementation exists to support reusability of the cell
//protocol, allowing the cell to be fully customizable if needed.
extension SimpleTextCellProtocol {
    var font: UIFont {
        return .systemFont(ofSize: 15, weight: .light)
    }
    var color: UIColor {
        return .systemGray
    }
}
