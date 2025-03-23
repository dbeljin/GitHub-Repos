//
//  RepoTagsTableViewModel.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

class RepoTagsTableViewModel: RepoTagsTableViewProtocol {
    
    private(set) var repo: Repository
    private(set) var networking: RepoTagsNetworkingProtocol
    public weak var uiObserver: RepoTagsUIObserver?
    
    private var tableView: UITableView!
    private let activityIndicator = ActivityIndicator()
    private let sectionChecker = TableViewSectionChecker(tableSections: RepoTagsTableViewSections.self)
    private var tags: [Tag] = []
    private var fetchingWasSuccessful: Bool = false
    
    init(with repo: Repository, networking: RepoTagsNetworkingProtocol = RepoTagsNetworking()) {
        self.repo = repo
        self.networking = networking
    }
    
    func setupTableView(_ tableView: UITableView, _ topBarHeight: CGFloat) {
        tableView.registerNib(cellClass: HeaderTableViewCell.self)
        tableView.registerNib(cellClass: TagTableViewCell.self)
        tableView.registerNib(cellClass: SimpleTextTableViewCell.self)
        self.tableView = tableView
        activityIndicator.display(on: tableView, considering: topBarHeight)
        setTitle()
        fetchData()
    }
    
    func getNumberOfSections() -> Int {
        RepoTagsTableViewSections.allCases.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        if sectionChecker.selectedSection(section, is: .header) {
            return 1
        } else if sectionChecker.selectedSection(section, is: .tags) {
            return tags.count
        } else if sectionChecker.selectedSection(section, is: .noTags) {
            return fetchingWasSuccessful && tags.isEmpty ? 1 : 0
        }
        return 0
    }
    
    func getCell(for indexPath: IndexPath) -> UITableViewCell {
        if sectionChecker.selectedSection(indexPath.section, is: .header) {
            return getHeaderCell(for: indexPath)
        } else if sectionChecker.selectedSection(indexPath.section, is: .tags) {
            return getTagCell(for: indexPath)
        } else if sectionChecker.selectedSection(indexPath.section, is: .noTags) {
            return getEmptyCell(for: indexPath)
        }
        return UITableViewCell()
    }
    
    func didSelectRow(at indexPath: IndexPath) {}
    
    private func setTitle() {
        let title = String.localizedStringWithFormat(NSLocalizedString("TagListTitle", comment: ""), repo.name)
        uiObserver?.setTitle(title)
    }
    
    private func fetchData() {
        networking.fetchTags(for: repo.getUsername(), with: repo.name) { [weak self] tags, errorMessage in
            guard let tags else {
                self?.stopAnimationAndReloadDataAfterFetching()
                self?.handleError(errorMessage)
                return
            }
            self?.handleSuccessfullyFetchedData(tags)
        }
    }
    
    private func handleSuccessfullyFetchedData(_ tags: [Tag]) {
        self.tags = tags
        fetchingWasSuccessful = true
        stopAnimationAndReloadDataAfterFetching()
    }
    
    private func stopAnimationAndReloadDataAfterFetching() {
        activityIndicator.stopAnimating()
        uiObserver?.reloadData()
    }
    
    private func handleError(_ errorMessage: ErrorMessage?) {
        let errorTitle = errorMessage?.title ?? String(localized: "ErrorTitle")
        let errorDescription = errorMessage?.body ?? String(localized: "ErrorMessage")
        uiObserver?.showAlertAndReturn(title: errorTitle, description: errorDescription)
    }
    
    private func getEmptyCell(for indexPath: IndexPath) -> SimpleTextTableViewCell {
        let emptyCell: SimpleTextTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        emptyCell.configure(using: EmptyTagListCellModel())
        return emptyCell
    }
    
    private func getHeaderCell(for indexPath: IndexPath) -> HeaderTableViewCell {
        let headerCell: HeaderTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        headerCell.configure(with: HeaderCellModel(with: repo))
        return headerCell
    }
    
    private func getTagCell(for indexPath: IndexPath) -> TagTableViewCell {
        let tagCell: TagTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        tagCell.configure(using: TagTextCellModel(with: tags[indexPath.row]))
        return tagCell
    }
}
