//
//  SecondView.swift
//  ozousan
//
//  グリッドを作る QGrid ライブラリを使用
//  Created by 宮本光直 on 2021/06/23.
//

import SwiftUI
import QGrid
import Kingfisher

struct GridData: Identifiable {
    let id: Int
    let imageName: String
    let title: String
}

struct QGridItem: View {
    var data: GridData
    var body: some View {
        VStack {
            KFImage(URL(string: data.imageName)!)
                .resizable()
                .scaledToFit()
                .padding([.horizontal, .top], 7)
        }
    }
}

struct GridTestView: View {
    
    @ObservedObject var pixabayViewModel: PixabayViewModel
    
    var body: some View {
        
        VStack{
            if let images = pixabayViewModel.pixabayImages?.hits {
                VStack{
                    QGrid(images,
                          columns: 3,
                          columnsInLandscape: 4,
                          vSpacing: 50,
                          hSpacing: 20,
                          vPadding: 100,
                          hPadding: 20
                    ) { data in
                        GridCell(pixabay: data)
                    }
                }
            } else {
                Text("111")
            }
        }
        .onAppear{
            self.pixabayViewModel.fetchImagesByPixabay()
        }
    }
}


struct GridCell: View {
    var pixabay: Pixabay
    var body: some View {
        VStack {
            KFImage(URL(string: pixabay.previewURL)!)
                .resizable()
                .scaledToFit()
                .shadow(color: .primary, radius: 5)
                .padding([.horizontal, .top], 7)
            
            Text(pixabay.user)
        }
    }
}

