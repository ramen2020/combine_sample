//
//  FavoriteContentView.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/07/04.
//

import SwiftUI
import Kingfisher

struct QiitaFavoriteContentView: View {
    
    @EnvironmentObject var qiitaViewModel: QiitaViewModel
    
    var body: some View {
        List {
            if qiitaViewModel.favoriteArticles.isEmpty {
                Text("お気に入りは現在ないです。")
                    .padding()
            } else {
                ForEach(0..<qiitaViewModel.favoriteArticles.count, id: \.self) { index in
                    NavigationLink(destination: WebView(urlString: qiitaViewModel.favoriteArticles[index].url)) {
                        HStack {
                            //                        KFImage(URL(string:qiitaViewModel.favoriteArticles[index].user.profile_image_url)!)
                            //                            .frame(width: 40, height: 40)
                            //                            .clipShape(Circle())
                            VStack() {
                                Text("\(qiitaViewModel.favoriteArticles[index].title)")
                                    .font(.system(size: 15))
                                //                            Text("\(qiitaViewModel.favoriteArticles[index].user.name)")
                                //                                .foregroundColor(.red)
                                //                                .font(.system(size: 12))
                            }
                            Spacer()
                            FavoriteButton(
                                qiitaViewModel: qiitaViewModel,
                                articles: qiitaViewModel.favoriteArticles,
                                favoriteArticlesIds: qiitaViewModel.favoriteArticlesIds,
                                index: index
                            )
                        }
                    }.padding()
                }
            }
        }
    }
}

struct QiitaFavoriteContentView_Previews: PreviewProvider {
    static var previews: some View {
        QiitaFavoriteContentView().environmentObject(QiitaViewModel())
    }
}
