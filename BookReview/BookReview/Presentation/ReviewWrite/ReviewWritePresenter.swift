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
    private let userDefaultsManager = UserDefaultsManager()
    private var book: Book?
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
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
    
    func saveButtonDidTap(content: String?) {
        guard let book = book,
              let content = content,
              content != contentsTextViewPlaceHolderText
        else { return }
        
        let bookReview = BookReview(
            title: book.title,
            content: content,
            imageURL: book.imageURL
        )
        userDefaultsManager.saveReview(bookReview)
        viewController.close()
    }
    
    func bookTitleButtonDidTap() {
        viewController.presentToSearchBookVC()
    }
}

// MARK: - SearchBookDelegate

extension ReviewWritePresenter: SearchBookDelegate {
    
    func selectBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
