//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by 김민 on 2023/05/30.
//

import Foundation
@testable import BookReview

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    
    var isCalledGetReviews = false
    var isCalledSaveReviews = false
    
    func getReviews() -> [BookReview] {
        isCalledGetReviews = true
        
        return []
    }
    
    func saveReview(_ newValue: BookReview) {
        isCalledSaveReviews = true
    }
}
