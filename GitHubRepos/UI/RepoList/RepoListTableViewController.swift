//
//  RepoListTableViewController.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

class RepoListTableViewController: UITableViewController {
    
    var viewModel: RepoListTableViewProtocol = RepoListTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String(localized: "RepoListTitle")
        initialModelSetup()
    }
    
    private func initialModelSetup() {
        viewModel.setupTableView(tableView, navigationBottomPosition)
        viewModel.uiObserver = self
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getNumberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows(in: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.getCell(for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }

}

extension RepoListTableViewController: RepoListUIObserver {
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showAlert(title: String, description: String) {
        showAlert(title: title,
                  message: description,
                  leftButtonText: String(localized: "Cancel"),
                  rightButtonText: String(localized: "Retry"),
                  actionHandler: { [weak self] _ in
                      self?.viewModel.retryFetching()
                  })
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func openRepo(_ repo: Repository) {
        //TODO: Go to next page and fetch that repo
        print(repo.name)
    }
}
