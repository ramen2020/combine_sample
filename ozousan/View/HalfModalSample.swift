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
    @State var showPopUp = false
    
    var body: some View {
        ZStack{
            VStack{
                // PartialSheet
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
                
                
                // ポップアップ
                Button(action: {
                    // 2. showPartialをfalseからtrueにtoggle
                    // withAnimationでふんわり出てくる
                    withAnimation(.linear(duration: 0.1)) {
                        showPopUp.toggle()
                    }
                }) {
                    Text("Open pop up")
                }
            }
            PopUpView(show: $showPopUp)
        }
    }
}

// ポップアップの中身
struct PopUpView: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            if show {
                // 背景色をグレーに。
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 0) {
                    Text("ようこそ")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45, alignment: .center)
                        .font(Font.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.black)
                        .padding()
                    
                    HStack{
                        Button(action: {
                            withAnimation(.linear(duration: 0.2)) {
                                show = false
                            }
                        }, label: {
                            Text("NG")
                                .frame(maxWidth: .infinity)
                                .frame(height: 54, alignment: .center)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .font(Font.system(size: 23, weight: .semibold))
                        }).buttonStyle(PlainButtonStyle())
                        Button(action: {
                            withAnimation(.linear(duration: 0.2)) {
                                show = false
                            }
                        }, label: {
                            Text("OK")
                                .frame(maxWidth: .infinity)
                                .frame(height: 54, alignment: .center)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .font(Font.system(size: 23, weight: .semibold))
                        }).buttonStyle(PlainButtonStyle())
                    }
                }
                .border(Color.white, width: 2)
                .background(Color.white)
            }
        }.onTapGesture {
            withAnimation(.linear(duration: 0.2)) {
                show.toggle()
            }
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
