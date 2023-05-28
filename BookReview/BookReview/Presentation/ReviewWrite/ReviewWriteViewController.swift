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

        presenter.viewDidLoad()
    }
}

// MARK: - ReviewWriteProtocol

extension ReviewWriteViewController: ReviewWriteProtocol {
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        let closeButton = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(closeButtonDidTap)
        )
        let saveButton = UIBarButtonItem(
            title: "Save",
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = saveButton
    }
    
    func showCloseAlertSheet() {
        let alert = UIAlertController(
            title: "작성 중인 내용이 있습니다. 정말 닫으시겠습니까?",
            message: nil,
            preferredStyle: .alert
        )
        let closeAction = UIAlertAction(title: "닫기", style: .destructive) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        [closeAction, cancelAction].forEach {
            alert.addAction($0)
        }
        
        present(alert, animated: true)
    }
}

private extension ReviewWriteViewController {
    
    // MARK: - @objc Methods
    
    @objc private func closeButtonDidTap() {
        presenter.closeButtonDidTap()
    }
}
