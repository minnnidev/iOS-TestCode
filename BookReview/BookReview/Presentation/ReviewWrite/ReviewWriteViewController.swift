//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import UIKit

import SnapKit
import Then

final class ReviewWriteViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var presenter = ReviewWritePresenter(viewController: self)

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
}

extension ReviewWriteViewController: ReviewWriteProtocol {
    g
}
