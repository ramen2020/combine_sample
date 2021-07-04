//
//  PixabayAPI.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/23.
//

import Foundation

struct PixabayAPI: Codable {
    let total: Int
    let totalHits: Int
    let hits: [Pixabay]
}


struct Pixabay: Codable,Identifiable {
    let id: Int
    let type: String
    let previewURL: String
    let webformatURL: String
    let user: String
    let userImageURL: String
    let likes: Int
}


//
//struct User: Codable {
//    let name: String
//    let profile_image_url: String
//}

