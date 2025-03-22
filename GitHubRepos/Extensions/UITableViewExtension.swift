//
//  UITableViewExtension.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

extension UITableView {
    
    func registerNib<T: UITableViewCell>(cellClass: T.Type) {
        register(UINib(nibName: String(describing: cellClass), bundle: Bundle(identifier: Bundle.main.bundleIdentifier ?? "")), forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
}
