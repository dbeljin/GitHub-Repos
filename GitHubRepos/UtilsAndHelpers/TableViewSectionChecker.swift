//
//  TableViewSectionChecker.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

struct TableViewSectionChecker<T : RawRepresentable> where T.RawValue == Int {
    
    var tableSections:T.Type
    public func selectedSection(_ section: Int, is comparingSection: T) -> Bool {
        guard let tableSection = tableSections.init(rawValue: section) else { return false }
        return tableSection == comparingSection
    }
}
