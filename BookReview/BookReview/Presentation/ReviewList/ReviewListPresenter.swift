//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import UIKit

protocol ReviewListProtocol {
    func setBackgroundColor()
    func setNavigationBar()
    func setLayout()
    func presentToReviewWriteVC()
}

final class ReviewListPresenter: NSObject {
    
    // MARK: - Properties
    
    private let viewController: ReviewListProtocol
    
    // MARK: - Initializer
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
}

extension ReviewListPresenter {
    
    // MARK: - Custom Methods
    
    func viewDidLoad() {
        viewController.setBackgroundColor()
        viewController.setNavigationBar()
        viewController.setLayout()
    }
    
    func plusButtonDidTap() {
        viewController.presentToReviewWriteVC()
    }
}

// MARK: - UITableViewDataSource

extension ReviewListPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        return cell
    }
}
