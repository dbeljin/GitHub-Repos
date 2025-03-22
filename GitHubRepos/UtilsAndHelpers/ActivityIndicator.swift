//
//  ActivityIndicator.swift
//  GitHubRepos
//
//  Created by Dusan Beljin on 22.3.25..
//

import UIKit

class ActivityIndicator: UIActivityIndicatorView {

    init() {
        super.init(frame: CGRect.zero)
        style = .medium
        hidesWhenStopped = true
        color = .systemBlue
        startAnimating()
    }

    public func display(on view: UIView, considering topBarHeight: CGFloat = 0) {
        view.addSubview(self)
        centerInsideParent(withTopConstant: -topBarHeight)
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func startAnimating() {
        super.startAnimating()
        superview?.bringSubviewToFront(self)
        superview?.isUserInteractionEnabled = false
    }
    
    override func stopAnimating() {
        super.stopAnimating()
        superview?.isUserInteractionEnabled = true
    }
}
