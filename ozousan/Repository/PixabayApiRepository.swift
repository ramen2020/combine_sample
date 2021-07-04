//
//  PixabayViewModel.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/23.
//

import Alamofire
import Combine

final class PixabayApiRepository {

    static func fetchPixabayImages() -> AnyPublisher<PixabayAPI, AFError> {
        let decoder = JSONDecoder()
        let baseURL = "https://pixabay.com/api"
        let parameters = ["key": "22197735-702f5d4bb88361f46126f6c8a"]
        let result = AF.request(
            baseURL,
            method: .get,
            parameters: parameters,
            encoder: URLEncodedFormParameterEncoder.default
        )
        .publishDecodable(type: PixabayAPI.self, decoder: decoder)
        .value()
        .eraseToAnyPublisher()
    
        return result
    }
}

