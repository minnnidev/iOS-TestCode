//
//  ViewController.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import UIKit

final class ReviewListViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var presenter = ReviewListPresenter(viewController: self)
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
}

extension ReviewListViewController {
    
    // MARK: - Custom Methods
    
    private func setLayout() {
        view.backgroundColor = .white
    }
}

extension ReviewListViewController: ReviewListProtocol { }
