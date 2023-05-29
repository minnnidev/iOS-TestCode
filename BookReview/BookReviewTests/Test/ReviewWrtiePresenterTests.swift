//
//  ReviewWrtiePresenterTests.swift
//  BookReviewTests
//
//  Created by 김민 on 2023/05/30.
//

import XCTest
@testable import BookReview

final class ReviewWrtiePresenterTests: XCTestCase {
    
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewWritePresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad_호출() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetBackgroundColor)
        XCTAssertTrue(viewController.isCalledSetNavigationBar)
        XCTAssertTrue(viewController.isCalledSetLayout)
    }
    
    func test_closeButtonDidTap_호출() {
        sut.closeButtonDidTap()
        
        XCTAssertTrue(viewController.isCalledShowCloseAlertSheet)
    }
    
    func test_saveButtonDidTap_호출될_때_book이_존재하지_않으면() {
        sut.book = nil
        sut.saveButtonDidTap(content: "Swift 공부 화이띵!")
        
        XCTAssertFalse(userDefaultsManager.isCalledSaveReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_saveButtonDidTap_호출될_때_book이_존재하고_content가_존재하지_않으면() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.saveButtonDidTap(content: nil)
        
        XCTAssertFalse(userDefaultsManager.isCalledSaveReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_saveButtonDidTap_호출될_때_book이_존재하고_content가_placeHolder와_같지_않게_존재하면() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.saveButtonDidTap(content: "Swift 공부 화이띵!")
        
        XCTAssertTrue(userDefaultsManager.isCalledSaveReviews)
        XCTAssertTrue(viewController.isCalledClose)
    }
    
    func test_saveButtonDidTap_호출될_때_book이_존재하고_content가_placeHolder와_같으면() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.saveButtonDidTap(content: sut.contentsTextViewPlaceHolderText)
        
        XCTAssertFalse(userDefaultsManager.isCalledSaveReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_bookTitleButtonDidTap_호출() {
        sut.bookTitleButtonDidTap()
        
        XCTAssertTrue(viewController.isCalledPresentToSearchBookVC)
    }
}

final class MockReviewWriteViewController: ReviewWriteProtocol {
    
    var isCalledSetBackgroundColor = false
    var isCalledSetNavigationBar = false
    var isCalledSetLayout = false
    var isCalledShowCloseAlertSheet = false
    var isCalledClose = false
    var isCalledPresentToSearchBookVC = false
    var isCalledUpdateViews = false
    
    func setBackgroundColor() {
        isCalledSetBackgroundColor = true
    }
    
    func setNavigationBar() {
        isCalledSetNavigationBar = true
    }
    
    func setLayout() {
        isCalledSetLayout = true
    }
    
    func showCloseAlertSheet() {
        isCalledShowCloseAlertSheet = true
    }
    
    func close() {
        isCalledClose = true
    }
    
    func presentToSearchBookVC() {
        isCalledPresentToSearchBookVC = true
    }
    
    func updateViews(title: String, imageURL: URL?) {
        isCalledUpdateViews = true
    }
}
