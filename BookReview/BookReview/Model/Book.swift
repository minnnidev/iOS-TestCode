//
//  Book.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
}
