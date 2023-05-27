//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import Foundation

protocol ReviewListProtocol { }

final class ReviewListPresenter {
    
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
}
