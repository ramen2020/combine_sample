//
//  SecondView.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/23.
//

import SwiftUI
import QGrid
import Kingfisher

struct GridData2: Identifiable {
    let id: Int
    let imageName: String
    let title: String
}

struct QGridItem2: View {
    var data: GridData2
    var body: some View {
        VStack {
            KFImage(URL(string: data.imageName)!)
                .resizable()
                .scaledToFit()
                .padding([.horizontal, .top], 7)
        }
    }
}

struct FourthView: View {

    let datas: [GridData2] = [
        GridData2(id: 1, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本１"),
        GridData2(id: 2, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本２"),
        GridData2(id: 3, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本３"),
        GridData2(id: 1, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本４"),
        GridData2(id: 2, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本５"),
        GridData2(id: 3, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本６"),
        GridData2(id: 1, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本７"),
        GridData2(id: 2, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本８"),
        GridData2(id: 3, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本９"),
        GridData2(id: 3, imageName: "https://cdn.pixabay.com/photo/2021/06/17/19/06/sunset-6344387_150.jpg", title: "宮本１０")
    ]
    
    var body: some View {
        
        VStack{
            QGrid(self.datas,
                  columns: 3,
                  columnsInLandscape: 4,
                  vSpacing: 50,
                  hSpacing: 20,
                  vPadding: 100,
                  hPadding: 20
            ) { image in
                QGridItem2(data: image)
            }
        }
    }
}

