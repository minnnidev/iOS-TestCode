//
//  BookReview.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import Foundation

struct BookReview: Codable {
    let title: String
    let content: String
    let imageURL: URL?
}
