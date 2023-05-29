//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import UIKit

import Kingfisher

protocol ReviewListProtocol {
    func setBackgroundColor()
    func setNavigationBar()
    func setLayout()
    func presentToReviewWriteVC()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    
    // MARK: - Properties
    
    private let viewController: ReviewListProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    private var bookReviews: [BookReview] = []
    
    // MARK: - Initializer
    
    init(viewController: ReviewListProtocol,
         userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
}

extension ReviewListPresenter {
    
    // MARK: - Custom Methods
    
    func viewWillAppear() {
        bookReviews = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
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
        return bookReviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let review = bookReviews[indexPath.row]
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.content
        cell.imageView?.kf.setImage(with: review.imageURL, placeholder: .none, completionHandler: { _ in
            cell.setNeedsLayout()
            // 사진이 업로드되면 한번 더 업데이트하도록
        })
        cell.selectionStyle = .none
        return cell
    }
}
