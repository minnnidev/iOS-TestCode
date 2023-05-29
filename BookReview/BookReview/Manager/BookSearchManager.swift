//
//  BookSearchManager.swift
//  BookReview
//
//  Created by 김민 on 2023/05/29.
//

import UIKit

import Alamofire

struct BookSearchManager {
    
    private let id = Bundle.main.object(forInfoDictionaryKey: "X_Naver_Client_Id") as? String
    private let secret = Bundle.main.object(forInfoDictionaryKey: "X_Naver_Client_Secret") as? String
    
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        guard let id = id else { return }
        guard let secret = secret else { return }
        let parameters = BookSearchRequestModel(query: keyword)
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": id,
            "X-Naver-Client-Secret": secret
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

