//
//  RepoTagsTableViewController.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

class RepoTagsTableViewController: UITableViewController {
    
    public var viewModel: RepoTagsTableViewProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialModelSetup()
    }
    
    private func initialModelSetup() {
        viewModel.uiObserver = self
        viewModel.setupTableView(tableView, navigationBottomPosition)
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
}

extension RepoTagsTableViewController: RepoTagsUIObserver {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showAlertAndReturn(title: String, description: String) {
        showSimpleAlert(title: title, message: description) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
