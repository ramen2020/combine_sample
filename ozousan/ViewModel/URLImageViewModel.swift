//
//  URLからimageを取得する 自作class
//  king fisherの代わり（SwiftUIに対応はしている）
//  URLImageViewModel.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/21.
//

import Foundation
import SwiftUI

final class URLImageViewModel: ObservableObject {
    
    @Published var downloadData: Data? = nil
    let url: String
    
    init(url: String, isSync: Bool = false) {
        self.url = url
        if isSync {
            self.downloadImageSync(url: self.url)
        } else {
            self.downloadImageAsync(url: self.url)
        }
    }
    
    func downloadImageAsync(url: String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
                
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }
    }
    
    func downloadImageSync(url: String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        let data = try? Data(contentsOf: imageURL)
        self.downloadData = data
    }
}
