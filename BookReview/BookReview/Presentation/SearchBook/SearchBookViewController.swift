//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import UIKit

import SnapKit
import Then

final class SearchBookViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var presenter = SearchBookPresenter(viewController: self)

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
    }
}

extension SearchBookViewController: SearchBookProtocol {
    
}
