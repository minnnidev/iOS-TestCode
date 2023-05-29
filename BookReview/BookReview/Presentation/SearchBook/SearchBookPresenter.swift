//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import UIKit

protocol SearchBookProtocol {
    
}

final class SearchBookPresenter {
    
    // MARK: - Properties
    
    private let viewController: SearchBookProtocol
    
    // MARK: - Initializer
    
    init(viewController: SearchBookProtocol) {
        self.viewController = viewController
    }
}
