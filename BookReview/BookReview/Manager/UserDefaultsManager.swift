//
//  UserDefaultsManager.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import Foundation

/*
프로토콜을 사용하는 이유?
프로토콜을 작성했을 때, 테스트 코드 작성이 좀 더 쉽다고 함
*/

protocol UserDefaultsManagerProtocol {
    func getReviews() -> [BookReview]
    func saveReview(_ newValue: BookReview)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    
    enum Key: String {
        case review
    }
    
    func getReviews() -> [BookReview] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([BookReview].self, from: data)) ?? []
    }
    
    func saveReview(_ newValue: BookReview) {
        var currentReviews: [BookReview] = getReviews()
        currentReviews.insert(newValue, at: 0)
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentReviews), forKey: Key.review.rawValue)
    }
}
