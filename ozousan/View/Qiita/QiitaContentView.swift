//
//  QiitaContentView.swift
//  SwiftUI Architecture
//
//  Created by 宮本光直 on 2021/06/23.
//

import SwiftUI

struct QiitaContentView: View {
    
    @EnvironmentObject var qiitaViewModel: QiitaViewModel
    
    var body: some View {
        VStack {
            // 検索bar
            QiitaSearchTextField(searchWord: $qiitaViewModel.searchWord, qiitaViewModel: qiitaViewModel)
            // cellのview
            QiitaCell(
                qiitaViewModel: qiitaViewModel,
                articles: qiitaViewModel.articles,
                favoriteArticlesIds: qiitaViewModel.favoriteArticlesIds
            )
        }
        // 画面読み込み時の処理
        .onAppear{
            self.qiitaViewModel.fetchArticles()
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
        
    }
}

// PreviewProvider
//struct QiitaContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        QiitaContentView().environmentObject(QiitaViewModel())
//    }
//}

extension UIApplication {
    // 背景タップでキーボード閉じる処理
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
