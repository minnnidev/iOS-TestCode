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
    func showCloseAlertSheet()
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
    }
    
    func closeButtonDidTap() {
        viewController.showCloseAlertSheet()
    }
}
