//
//  DefaultTableViewProtocol.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

protocol DefaultTableViewProtocol {
    func setupTableView(_ tableView: UITableView, _ topBarHeight: CGFloat)
    func getNumberOfSections() -> Int
    func getNumberOfRows(in section: Int) -> Int
    func getCell(for indexPath: IndexPath) -> UITableViewCell
    func didSelectRow(at indexPath: IndexPath)
}
