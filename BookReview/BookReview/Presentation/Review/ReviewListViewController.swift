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
    
    // MARK: - Properties
    
    private lazy var presenter = ReviewListPresenter(viewController: self)
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setNavigationBar()
    }
}

extension ReviewListViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        
    }
    
    private func setNavigationBar() {
        let plusButton = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain, target: self,
            action: #selector(plusButtonDidTap))
        navigationItem.rightBarButtonItem = plusButton
        navigationItem.title = "도서 리뷰"
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - @objc Methods
    
    @objc private func plusButtonDidTap() {
        print("플러스 버튼 누름")
    }
}

extension ReviewListViewController: ReviewListProtocol { }
