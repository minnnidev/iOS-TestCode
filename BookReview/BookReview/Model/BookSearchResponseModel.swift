//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}
