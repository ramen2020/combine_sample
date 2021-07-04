//
//  QiitaViewModel.swift
//  SwiftUI Architecture
//
//  Created by 宮本光直 on 2021/06/23.
//

import Foundation
import Combine
import Alamofire
import RealmSwift

protocol QiitaViewModelInputs {
    
    //var emailText: AnyObserver<String> {get}
}

protocol QiitaViewModelOutputs {
    //var loginResponse: Observable<KuraselToken> {get}
}

protocol QiitaViewModelType {
    var inputs: QiitaViewModelInputs {get}
    var outputs: QiitaViewModelOutputs {get}
}


class QiitaViewModel: ObservableObject, QiitaViewModelOutputs, QiitaViewModelInputs {
    // MARK: Input
    @Published var searchWord = ""
    
    // MARK: Output
    @Published var articles: [Qiita] = []            // APIから取得した記事
    @Published var favoriteArticles: [Qiita] = []    // いいねしている記事
    @Published var favoriteArticlesIds: [String] = []   // いいねしている記事のID
    
    private var disposables = Set<AnyCancellable>()
    
    init(){
        // realmからいいねしている記事のIDをfavoriteArticles格納
        let _favoriteArticles = (try? Realm().objects(FavoriteQiitaDB.self).map{ $0 }) ?? []
        // FavoriteQiitaDBからQiitaAPIへ型変換
        self.favoriteArticles = Array(_favoriteArticles).map({ (data: FavoriteQiitaDB) in data.QiitaStruct })

        // いいねしている記事のIDをfavoriteArticlesIdsへ格納
        self.favoriteArticles.forEach {
            self.favoriteArticlesIds.append($0.id)
        }
    }
    
    // いいね機能
    func toggleFavoriteArticle(article: Qiita){
        if self.favoriteArticlesIds.contains(article.id) {
            self.deleteFavorite(article: article)
            print("いいね削除しました！ \(article.id)")
        } else {
            self.createFavorite(article: article)
            print("いいねしました！ \(article.id)")
        }
    }
    
    // いいね処理
    func createFavorite(article: Qiita) {
        do {
            let realm = try Realm()
            let favoriteQiitaDB = FavoriteQiitaDB()
            favoriteQiitaDB.id = article.id
            favoriteQiitaDB.title = article.title
            favoriteQiitaDB.url = article.url
            try realm.write {
                realm.add(favoriteQiitaDB)
                self.favoriteArticlesIds.append(article.id)
                self.favoriteArticles.append(article)
            }
        } catch let error {
            print("お気に入りでエラー： \(error)")
            print(error.localizedDescription)
        }
    }
    
    // いいね外す処理
    func deleteFavorite(article: Qiita) {
        do {
            let realm = try Realm()
            let targetFavoriteQiita = realm.objects(FavoriteQiitaDB.self).filter("id == '\(article.id)'")
            try realm.write {
                realm.delete(targetFavoriteQiita)
            }
            let targetFavoriteArticleIndex = self.favoriteArticlesIds.firstIndex(of: article.id)
            self.favoriteArticlesIds.remove(at: targetFavoriteArticleIndex!)
            self.favoriteArticles.remove(at: targetFavoriteArticleIndex!)
        } catch let error {
            print("お気に入り削除でエラー： \(error)")
            print(error.localizedDescription)
        }
    }
    
    func fetchArticles() {
        QiitaApiRepository.fetchArticles().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("error：\(error)")
            }
        }, receiveValue: { _articles in
            self.articles = _articles
        })
        .store(in: &disposables)
    }
    
    func fetchArticlesBySearchWord(searchWord: String) {
        QiitaApiRepository.fetchQiitaArticlesBySearchWord(searchWord: searchWord).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("error：\(error)")
            }
        }, receiveValue: { _articles in
            self.articles = _articles
        })
        .store(in: &disposables)
    }
}

//NOTE: inputをfuncにする場合　要検討
//extension LoginViewModel: LoginViewModelInputs {
//
//
//
//    func postLogin(email:String, password: String) {
//
//        LoginRepository.postLogin(email: email, password: password)
//
//    }
//
//}

extension QiitaViewModel: QiitaViewModelType {
    var inputs: QiitaViewModelInputs {return self}
    var outputs: QiitaViewModelOutputs {return self}
}

