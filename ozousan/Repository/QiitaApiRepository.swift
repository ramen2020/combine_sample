//
//  QiitaApiRepository.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/21.
//

import Foundation
import Alamofire
import Combine

final class QiitaApiRepository {

//    let baseURL = "https://qiita.com/api/v2/items"
        
    static func fetchArticles() -> AnyPublisher<[Article], AFError> {
        let decoder = JSONDecoder()
        let baseURL = "https://qiita.com/api/v2/items"
        let result = AF.request(
            baseURL,
            method: .get
        )
        .publishDecodable(type: [Article].self, decoder: decoder)
        .value()
        .eraseToAnyPublisher()
    
        return result
    }
    
    static func fetchQiitaArticlesBySearchWord(searchWord: String) -> AnyPublisher<[Article], AFError> {
        let baseURL = "https://qiita.com/api/v2/items"
        let parameters = ["query": searchWord]
        let decoder = JSONDecoder()
        let result = AF.request(
            baseURL,
            method: .get,
            parameters: parameters
        )
        .publishDecodable(type: [Article].self, decoder: decoder)
        .value()
        .eraseToAnyPublisher()

        return result
    }
    
    static func fetchQiitaArticlesByTag(tag: String) -> AnyPublisher<[Article], AFError> {
        let baseURL = "https://qiita.com/api/v2/tags/\(tag)/items"
        let decoder = JSONDecoder()
        print(baseURL)
        let result = AF.request(
            baseURL,
            method: .get
        )
        .publishDecodable(type: [Article].self, decoder: decoder)
        .value()
        .eraseToAnyPublisher()

        return result
    }

}

