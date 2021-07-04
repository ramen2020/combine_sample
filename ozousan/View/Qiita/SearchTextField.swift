//
//  searchTextField.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/22.
//

import SwiftUI

struct SearchTextField: View {
    
    @Binding var searchWord: String
    @State private var isErrorTextField = false // textFieldバリデーションメッセージ
    
    var qiitaViewModel: QiitaViewModel
    
    var body: some View {
        
        HStack{
            TextField("検索してください。",
                      text: $searchWord,
                      // キーボードでエンター押した時
                      onCommit: {
                        if (searchWord.count > 1) {
                            self.isErrorTextField = false
                            self.qiitaViewModel.fetchArticlesBySearchWord(searchWord: searchWord)
                        } else {
                            self.isErrorTextField = true
                        }
                      })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if(isErrorTextField) {
                Text("※ 2文字以上入力してください")
                    .foregroundColor(.red)
                    .font(.system(size: 15))
            }
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.primary)
                    .frame(width:30, height: 30)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
            }
        }.padding()
    }
    
}
