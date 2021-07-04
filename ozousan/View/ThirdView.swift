//
//  ThirdView.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/23.
//

import SwiftUI

struct ThirdView: View {

    @ObservedObject var pixabayViewModel: PixabayViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) { // カラム数の指定
                ForEach((1...10), id: \.self) { index in
                    URLImageView(viewModel: .init(url: "\(pixabayViewModel.pixabayImages?.hits[index].previewURL ?? "")"))
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding()
                }
            }
        }        .onAppear{
            self.pixabayViewModel.fetchImagesByPixabay()
        }
    }
}
