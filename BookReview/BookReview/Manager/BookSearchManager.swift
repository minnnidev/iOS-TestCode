//
//  BookSearchManager.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import UIKit

import Alamofire

struct BookSearchManager {
    
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        let parameters = BookSearchRequestModel(query: keyword)
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id":"tGy9ShDXd1Zg0KT1rNnE",
            "X-Naver-Client-Secret":"E0VlZAo29E"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: BookSearchResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

