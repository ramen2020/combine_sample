//
//  searchTextField.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/22.
//

import SwiftUI

struct QiitaSearchTextField: View {
    
    @Binding var searchWord: String
    
    var qiitaViewModel: QiitaViewModel
    
    var body: some View {
        
        HStack{
            TextField("検索してください。",
                      text: $searchWord,
                      // キーボードでエンター押した時
                      onCommit: {
                        self.qiitaViewModel.fetchArticlesBySearchWord(searchWord: searchWord)
                      })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
                Button (action: {
                    self.qiitaViewModel.fetchArticlesBySearchWord(searchWord: searchWord)
                }) {
                    ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.primary)
                        .frame(width:30, height: 30)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                    }
                }
        }.padding()
    }
    
}
