//
//  QiitaCell.swift
//  SwiftUI Architecture
//
//  Created by 宮本光直 on 2021/06/23.
//

import SwiftUI
import Kingfisher

struct QiitaCell: View {
    
    let qiitaViewModel : QiitaViewModel
    let articles: [Qiita]
    let favoriteArticlesIds: [String]
    
    var body: some View {
        List {
            if articles.isEmpty {
                Indicator().frame(width: 44, height: 44) // Indicator
            } else {
                ForEach(0..<articles.count, id: \.self) { index in
                    NavigationLink(destination: WebView(urlString: articles[index].url)) {
                        HStack {
                            //                        KFImage(URL(string: articles[index].user.profile_image_url)!)
                            //                            .frame(width: 40, height: 40)
                            //                            .clipShape(Circle())
                            VStack() {
                                Text("\(articles[index].title)")
                                    .font(.system(size: 15))
                                //                            Text("\(articles[index].user.name)")
                                //                                .foregroundColor(.red)
                                //                                .font(.system(size: 12))
                            }
                            Spacer()
                            FavoriteButton(
                                qiitaViewModel: qiitaViewModel,
                                articles: articles,
                                favoriteArticlesIds: favoriteArticlesIds,
                                index: index
                            )
                        }.padding()
                    }
                    
                }
            }
        }
    }
}


struct FavoriteButton: View {
    
    let qiitaViewModel: QiitaViewModel
    let articles: [Qiita]
    let favoriteArticlesIds: [String]
    let index: Int
    
    var body: some View {
        Button (action: {
            //
        }) {
            ZStack {
                Image(systemName: favoriteArticlesIds.contains(articles[index].id) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
        } .onTapGesture {
            self.qiitaViewModel.toggleFavoriteArticle(article: articles[index])
        }
    }
}

