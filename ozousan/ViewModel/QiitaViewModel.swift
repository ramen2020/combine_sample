//
//  ViewModel.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/21.
//

import Foundation
import Combine
import Alamofire

class QiitaViewModel: ObservableObject {
    // MARK: Input
    @Published var searchWord = ""
    
    // MARK: Output
    @Published var articles: [Article] = []
    
    private var disposables = Set<AnyCancellable>()
    
    func fetchArticles() {
        QiitaApiRepository.fetchArticles().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("えらーーーーーーーー：\(error)")
            }
        }, receiveValue: { article in
            self.articles = article
        })
        .store(in: &disposables)
        
    }
    
    func fetchArticlesBySearchWord(searchWord: String) {
        QiitaApiRepository.fetchQiitaArticlesBySearchWord(searchWord: searchWord).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("えらーーーーーーーー：\(error)")
            }
        }, receiveValue: { article in
            self.articles = article
        })
        .store(in: &disposables)
    }
    
    func fetchArticlesByTag(tag: String) {
        QiitaApiRepository.fetchQiitaArticlesByTag(tag: tag).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("えらーーーーーーーー：\(error)")
            }
        }, receiveValue: { article in
            self.articles = article
        })
        .store(in: &disposables)
    }
    
}

