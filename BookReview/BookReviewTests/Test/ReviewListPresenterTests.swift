//
//  ReviewListPresenterTests.swift
//  BookReviewTests
//
//  Created by 김민 on 2023/05/28.
//

import XCTest
@testable import BookReview

final class ReviewListPresenterTests: XCTestCase {
    
    /*
    1. 테스트에서는 안 되는 건 빨리 찾아야 하므로 옵셔널 강제 언래핑 추천~!
    2. 테스트 대상을 칭하는 변수명은 보통 sut
    */
    var sut: ReviewListPresenter!
    var viewController: MockReviewListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        sut = ReviewListPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager
        )
        
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad_호출() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetBackgroundColor)
        XCTAssertTrue(viewController.isCalledSetNavigationBar)
        XCTAssertTrue(viewController.isCalledSetLayout)
    }
    
    func test_plusButtonDidTap_호출() {
        sut.plusButtonDidTap()
        
        XCTAssertTrue(viewController.isCalledPresentToReviewWriteVC)
    }
    
    func test_viewWillAppear_호출() {
        sut.viewWillAppear()
       
        XCTAssertTrue(userDefaultsManager.isCalledGetReviews)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
}
