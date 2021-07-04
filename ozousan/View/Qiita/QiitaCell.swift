//
//  File.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/22.
//

import SwiftUI

struct QiitaCell: View {
    
    private let articleData: [Article]
    
    init(articleData: [Article]) {
        self.articleData = articleData
    }
    
    var body: some View {
        List {
            if articleData.isEmpty {
                Indicator().frame(width: 44, height: 44) // Indicator
            } else {
                ForEach(0..<articleData.count) { article in
                    NavigationLink(destination: TodoContentView()) {
                        HStack {
                            URLImageView(viewModel: .init(url: "\(articleData[article].user.profile_image_url)"))
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            VStack() {
                                Text("\(articleData[article].title)").font(.system(size: 15))
                                Text("\(articleData[article].user.name)")
                                    .foregroundColor(.red)
                                    .font(.system(size: 12))
                            }
                        }
                    }
                }
            }
        }
    }
    
}
