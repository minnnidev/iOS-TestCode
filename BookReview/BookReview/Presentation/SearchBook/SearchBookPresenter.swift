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
    func reloadTableView()
}

protocol SearchBookDelegate {
    func selectBook(_ book: Book)
}

final class SearchBookPresenter: NSObject {
    
    // MARK: - Properties
    
    private let viewController: SearchBookProtocol
    private let bookSearchManager = BookSearchManager()
    private let delegate: SearchBookDelegate
    private var newBooks: [Book] = []
    
    // MARK: - Initializer
    
    init(viewController: SearchBookProtocol, delegate: SearchBookDelegate) {
        self.viewController = viewController
        self.delegate = delegate
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else { return }
        
        bookSearchManager.request(from: keyword) { [weak self] books in
            self?.newBooks = books
            self?.viewController.reloadTableView()
        }
    }
}

// MARK: - UITableViewDataSource

extension SearchBookPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = newBooks[indexPath.row].title
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchBookPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.selectBook(newBooks[indexPath.row])
        viewController.dismiss()
    }
}
