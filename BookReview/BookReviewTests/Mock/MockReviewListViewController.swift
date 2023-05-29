//
//  MockReviewListViewController.swift
//  BookReviewTests
//
//  Created by 김민 on 2023/05/30.
//

import Foundation
@testable import BookReview

final class MockReviewListViewController: ReviewListProtocol {
    // 프로토콜의 메소드가 원하는 타이밍에 잘 호출되는지 판단하는 클래스
    var isCalledSetBackgroundColor = false
    var isCalledSetNavigationBar = false
    var isCalledSetLayout = false
    var isCalledPresentToReviewWriteVC = false
    var isCalledReloadTableView = false
    
    func setBackgroundColor() {
        isCalledSetBackgroundColor = true
    }
    
    func setNavigationBar() {
        isCalledSetNavigationBar = true
    }
    
    func setLayout() {
        isCalledSetLayout = true
    }
    
    func presentToReviewWriteVC() {
        isCalledPresentToReviewWriteVC = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
}
