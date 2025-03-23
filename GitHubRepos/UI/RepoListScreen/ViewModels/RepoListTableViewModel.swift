//
//  RepoListTableViewModel.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

class RepoListTableViewModel: RepoListTableViewProtocol {
    
    private(set) var networking: RepoListNetworkingProtocol
    public weak var uiObserver: RepoListUIObserver?
    
    private var tableView: UITableView!
    private let activityIndicator = ActivityIndicator()
    private let sectionChecker = TableViewSectionChecker(tableSections: RepoListTableViewSections.self)
    private var repositoryList: [Repository] = []
    private var fetchingWasSuccessful: Bool = false

    
    // I created one mock example for you to see how it works
    // replace RepoListNetworking() with MockRepoListNetworking() below
    // the same approach can be used on another places as well
    
    init(networking: RepoListNetworkingProtocol = RepoListNetworking()) {
        self.networking = networking
    }
    
    func setupTableView(_ tableView: UITableView, _ topBarHeight: CGFloat) {
        tableView.registerNib(cellClass: SingleRepoTableViewCell.self)
        tableView.registerNib(cellClass: SimpleTextTableViewCell.self)
        self.tableView = tableView
        activityIndicator.display(on: tableView, considering: topBarHeight)
        fetchData()
    }
    
    func getNumberOfSections() -> Int {
        RepoListTableViewSections.allCases.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        if sectionChecker.selectedSection(section, is: .emptyList) {
            return repositoryList.isEmpty && fetchingWasSuccessful ? 1 : 0
        } else if sectionChecker.selectedSection(section, is: .repo) {
            return repositoryList.count
        }
        return 0
    }
    
    func getCell(for indexPath: IndexPath) -> UITableViewCell {
        if sectionChecker.selectedSection(indexPath.section, is: .emptyList) {
            return getEmptyCell(for: indexPath)
        } else if sectionChecker.selectedSection(indexPath.section, is: .repo) {
            return getRepoCell(for: indexPath)
        }
        return UITableViewCell()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        uiObserver?.openRepo(repositoryList[indexPath.row])
    }
    
    func retryFetching() {
        fetchData()
    }
    
    private func getRepoCell(for indexPath: IndexPath) -> SingleRepoTableViewCell {
        let repoCell: SingleRepoTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        repoCell.configure(using: SingleRepoCellModel(with: repositoryList[indexPath.row]))
        repoCell.layoutIfNeeded()
        return repoCell
    }
    
    private func getEmptyCell(for indexPath: IndexPath) -> SimpleTextTableViewCell {
        let emptyCell: SimpleTextTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        emptyCell.configure(using: EmptyRepoListCellModel())
        return emptyCell
    }
    
    private func stopAnimationAndReloadDataAfterFetching() {
        activityIndicator.stopAnimating()
        uiObserver?.reloadData()
    }
    
    private func fetchData() {
        activityIndicator.startAnimating()
        networking.fetchRepos(for: Constants.hardCodedUser) { [weak self] allRepos, errorMessage in
            guard let repos = allRepos else {
                self?.stopAnimationAndReloadDataAfterFetching()
                self?.handleError(errorMessage)
                return
            }
            self?.handleSuccessfullyFetchedData(repos)
        }
    }
    
    private func handleSuccessfullyFetchedData(_ repos: [Repository]) {
        fetchingWasSuccessful = true
        repositoryList = repos
        setNavigationTitle()
        stopAnimationAndReloadDataAfterFetching()
    }
    
    private func setNavigationTitle() {
        guard let firstRepo = repositoryList.first, !firstRepo.getUsername().isEmpty else { return }
        let title = String.localizedStringWithFormat(NSLocalizedString("RepoListTitleWithUser", comment: ""), firstRepo.getUsername().capitalized)
        uiObserver?.setTitle(title)
    }
    
    private func handleError(_ errorMessage: ErrorMessage?) {
        let errorTitle = errorMessage?.title ?? String(localized: "ErrorTitle")
        let errorDescription = errorMessage?.body ?? String(localized: "ErrorMessage")
        uiObserver?.showAlert(title: errorTitle, description: errorDescription)
    }
}
