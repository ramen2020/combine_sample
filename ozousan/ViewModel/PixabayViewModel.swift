//
//  PixabayViewModel.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/23.
//

import Foundation
import Combine
import Alamofire

class PixabayViewModel: ObservableObject {
    
    // MARK: Output
    @Published var pixabayImages : PixabayAPI?
    
    private var disposables = Set<AnyCancellable>()

    func fetchImagesByPixabay() {
        PixabayApiRepository.fetchPixabayImages().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("pixabayえらーーーーーーーー：\(error)")
            }
        }, receiveValue: { images in
            print(images)
            self.pixabayImages = images
        })
        .store(in: &disposables)
        
    }
}

