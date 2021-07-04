//
//  QiitaFavorite.swift
//  SwiftUI Architecture
//
//  Created by 宮本光直 on 2021/06/25.
//

import Foundation
import RealmSwift

class FavoriteQiitaDB: Object{
    @objc dynamic var id = ""
    @objc dynamic var url = ""
    @objc dynamic var title = ""

    // 主キーを使うと、データの更新や削除に便利
    override static func primaryKey() -> String? {
        "id"
    }
    
    // QiitaAPIの型に変換用
    var QiitaStruct: Qiita {
        get {
            return Qiita(id: self.id, url: self.url, title: self.title)
        }
    }
}
