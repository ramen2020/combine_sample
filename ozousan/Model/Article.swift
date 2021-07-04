//
//  Article.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/21.
//

import Foundation

struct Qiita: Codable, Identifiable{
    let id: String
    let url: String
    let title: String
//    let user: QiitaAPIUser
}

//struct QiitaAPIUser: Codable {
//    let name: String
//    let profile_image_url: String
//}

//extension QiitaAPI {
//  init(FavoriteQiitaDB: FavoriteQiitaDB) {
//    id = FavoriteQiitaDB.id
//    url = FavoriteQiitaDB.url
//    title = FavoriteQiitaDB.title
////    user = FavoriteQiitaDB.
////    number = FavoriteQiitaDB.number
//  }
//}
