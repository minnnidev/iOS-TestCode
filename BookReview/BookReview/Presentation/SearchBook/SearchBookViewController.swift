//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import UIKit

import SnapKit
import Then

final class SearchBookViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var bookTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = presenter
        tableView.delegate = presenter
        return tableView
    }()
    
    // MARK: - Properties
    
    private lazy var presenter = SearchBookPresenter(viewController: self, delegate: searchBookDelegate)
    private let searchBookDelegate: SearchBookDelegate
    
    // MARK: - Initializer
    
    init(searchBookDelegate: SearchBookDelegate) {
        self.searchBookDelegate = searchBookDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

// MARK: - SearchBookProtocol

extension SearchBookViewController: SearchBookProtocol {

    func setUI() {
        view.backgroundColor = .white
        
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        
        navigationItem.searchController = searchController
    }
    
    func setLayout() {
        view.addSubview(bookTableView)
        
        bookTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dismiss() {
        navigationItem.searchController?.dismiss(animated: true)
        dismiss(animated: true)
    }
    
    func reloadTableView() {
        bookTableView.reloadData()
    }
}
