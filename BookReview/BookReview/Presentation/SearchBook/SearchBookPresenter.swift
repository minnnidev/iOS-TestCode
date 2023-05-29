//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import UIKit

protocol SearchBookProtocol {
    func setUI()
    func setLayout()
    func dismiss()
}

final class SearchBookPresenter: NSObject {
    
    // MARK: - Properties
    
    private let viewController: SearchBookProtocol
    
    // MARK: - Initializer
    
    init(viewController: SearchBookProtocol) {
        self.viewController = viewController
    }
}

extension SearchBookPresenter {
    
    func viewDidLoad() {
        viewController.setUI()
        viewController.setLayout()
    }
}

// MARK: - UISearchBarDelegate

extension SearchBookPresenter: UISearchBarDelegate {
    
}

// MARK: - UITableViewDataSource

extension SearchBookPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchBookPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController.dismiss()
    }
}
