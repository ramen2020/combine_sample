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

    static func fetchArticles() -> AnyPublisher<[Qiita], AFError> {
        let target_url = "https://qiita.com/api/v2/items"
        return AF.request(
            target_url,
            method: .get
        )
        .publishDecodable(type: [Qiita].self, decoder: JSONDecoder())
        .value()
        .eraseToAnyPublisher()
    
    }
    
    static func fetchQiitaArticlesBySearchWord(searchWord: String) -> AnyPublisher<[Qiita], AFError> {
        let target_url = "https://qiita.com/api/v2/items"
        return AF.request(
            target_url,
            method: .get,
            parameters: ["query": searchWord]
        )
        .publishDecodable(type: [Qiita].self, decoder: JSONDecoder())
        .value()
        .eraseToAnyPublisher()
        
    }}

