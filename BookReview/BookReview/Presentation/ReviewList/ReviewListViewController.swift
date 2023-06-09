//
//  ViewController.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import UIKit

import SnapKit
import Then


final class ReviewListViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var reviewTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = presenter
        return tableView
    }()
    
    // MARK: - Properties
    
    private lazy var presenter = ReviewListPresenter(viewController: self)
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

// MARK: - ReviewListProtocol

extension ReviewListViewController: ReviewListProtocol {
    
    // MARK: - Custom Methods
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        navigationItem.title = "도서 리뷰"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let plusButton = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(plusButtonDidTap))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setLayout() {
        view.addSubview(reviewTableView)
        
        reviewTableView.snp.makeConstraints {
            $0.top.left.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    func presentToReviewWriteVC() {
        let vc = UINavigationController(rootViewController: ReviewWriteViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func reloadTableView() {
        reviewTableView.reloadData()
    }
}

private extension ReviewListViewController {
    
    // MARK: - @objc Methods
    
    @objc private func plusButtonDidTap() {
        presenter.plusButtonDidTap()
    }
}
