//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by 김민 on 2023/05/28.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class ReviewWriteViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var bookTitleButton = UIButton().then {
        $0.setTitle("책 제목", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.contentHorizontalAlignment = .leading
        $0.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        $0.addTarget(self, action: #selector(bookTitleButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var contentTextView = UITextView().then {
        $0.textColor = .lightGray
        $0.text = "내용을 입력해 주세요."
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.delegate = self
    }
    
    private let bookImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .secondarySystemBackground
    }
    
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
            action: #selector(saveButtonDidTap)
        )
        
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = saveButton
    }
    
    func setLayout() {
        view.addSubviews(bookTitleButton, contentTextView, bookImageView)
        
        bookTitleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        contentTextView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(bookTitleButton.snp.bottom).offset(16)
        }
        
        bookImageView.snp.makeConstraints {
            $0.leading.trailing.equalTo(bookTitleButton)
            $0.top.equalTo(contentTextView.snp.bottom).offset(16)
            $0.height.equalTo(200)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
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
    
    func close() {
        dismiss(animated: true)
    }
    
    func presentToSearchBookVC() {
        let vc = UINavigationController(rootViewController: SearchBookViewController(searchBookDelegate: presenter))
        present(vc, animated: true)
    }
    
    func updateViews(title: String, imageURL: URL?) {
        bookTitleButton.setTitle(title, for: .normal)
        bookTitleButton.setTitleColor(.black, for: .normal)
        bookImageView.kf.setImage(with: imageURL)
    }
}

private extension ReviewWriteViewController {
    
    // MARK: - @objc Methods
    
    @objc private func closeButtonDidTap() {
        presenter.closeButtonDidTap()
    }
    
    @objc private func saveButtonDidTap() {
        presenter.saveButtonDidTap()
    }
    
    @objc private func bookTitleButtonDidTap() {
        presenter.bookTitleButtonDidTap()
    }
}

// MARK: - UITextViewDelegate

extension ReviewWriteViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .lightGray else { return }
        textView.text = nil
        textView.textColor = .black
    }
}
