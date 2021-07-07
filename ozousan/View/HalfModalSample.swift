//
//  PopUpSample.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/07/07.
//

import SwiftUI
import PartialSheet

struct HalfModalSample: View {
    
    @State var showPartial = false

    var body: some View {
        // PartialSheetを開くためのButtonを作成
        Button(action: {
            // 2. showPartialをfalseからtrueにtoggle
            showPartial.toggle()
        }) {
            Text("Open PartialSheet")
        }
        // 3. showPartialがtrueになったらpartialSheetを呼び出す
        // プロパティ変更後の値を受け取るため$マークをつける
        .partialSheet(isPresented: $showPartial) {
            PartialSheetView()
        }
    }
}

// ハーフモーダルの中身
struct PartialSheetView: View {
    // EnvironmentObjectとしてPartialSheetManagerを定義
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    var body: some View {
        
        VStack {
            Text("Partial Sheet")
                .font(.title)
                .bold()
            Button(action: {
                // 下がるAnimationにする
                withAnimation() {
                    // 4. partialSheetを閉じる関数
                    partialSheetManager.closePartialSheet()
                }
            }) {
                Text("Close PartialSheet")
            }
            .padding(.vertical, 50.0)
        }
        // 5. モーダルビューの高さを指定
        .frame(height: 400)
    }
}

struct HalfModalSample_Previews: PreviewProvider {
    static var previews: some View {
        HalfModalSample()
    }
}
