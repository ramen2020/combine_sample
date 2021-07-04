//
//  UiImageView.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/22.
//

import SwiftUI

// urlから画像出力する
struct URLImageView: View {
    
    @ObservedObject var viewModel: URLImageViewModel
    
    var body: some View {
        if let imageData = self.viewModel.downloadData {
            if let image = UIImage(data: imageData) {
                return Image(uiImage: image).resizable()
            } else {
                return Image(uiImage: UIImage()).resizable()
            }
        } else {
            return Image(uiImage: UIImage()).resizable()
        }
    }
}
