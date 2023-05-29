//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import UIKit

protocol ReviewWriteProtocol {
    func setBackgroundColor()
    func setNavigationBar()
    func setLayout()
    func showCloseAlertSheet()
    func close()
    func presentToSearchBookVC()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter {
    
    // MARK: - Properties
    
    private let viewController: ReviewWriteProtocol
    
    // MARK: - Initializer
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
}

extension ReviewWritePresenter {
    
    func viewDidLoad() {
        viewController.setBackgroundColor()
        viewController.setNavigationBar()
        viewController.setLayout()
    }
    
    func closeButtonDidTap() {
        viewController.showCloseAlertSheet()
    }
    
    func saveButtonDidTap() {
        // TODO: - 유저가 작성한 도서 리뷰를 UserDefaults로 저장하기
        viewController.close()
    }
    
    func bookTitleButtonDidTap() {
        viewController.presentToSearchBookVC()
    }
}

// MARK: - SearchBookDelegate

extension ReviewWritePresenter: SearchBookDelegate {
    
    func selectBook(_ book: Book) {
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
