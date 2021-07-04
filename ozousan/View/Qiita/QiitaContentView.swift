import SwiftUI

struct QiitaContentView: View {
    @State private var isLoading = false // 読み込み中のローディング
    @State private var isModalShow: Bool = false // modal遷移のflg
    
    @ObservedObject var qiitaViewModel: QiitaViewModel
    
    var body: some View {
        VStack {
            // 検索bar
            SearchTextField(searchWord: $qiitaViewModel.searchWord, qiitaViewModel: qiitaViewModel)
            // cellのview
            QiitaCell(articleData: qiitaViewModel.articles)
        }
        // 画面読み込み時の処理 viewdidload
        .onAppear{
            self.qiitaViewModel.fetchArticles()
        }
        .onTapGesture {
            UIApplication.shared.closeKeyboard()
        }
        
    }
}

// PreviewProvider
struct QiitaContentView_Previews: PreviewProvider {
    static var previews: some View {
        QiitaContentView(qiitaViewModel: QiitaViewModel())
    }
}

extension UIApplication {
    // 背景タップでキーボード閉じる処理
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
