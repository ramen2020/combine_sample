//
//  modal.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/22.
//

import SwiftUI

// modal画面
struct modalView: View {
    var body: some View {
        GeometryReader { geometory in
            ZStack {
                VStack {
                    Text("modal遷移")
                }
            }
            .frame(width: geometory.size.width,
                   height: geometory.size.height)
            .animation(.easeInOut(duration: 0.42))
        }
        .transition(.move(edge: .bottom))
    }
}

// pop up画面
struct PopupView: View {
    @Binding var isPresent: Bool
    var body: some View {
        VStack(spacing: 12) {
            Text("Snorlax")
                .font(Font.system(size: 18).bold())
            
            Image("icon")
                .resizable()
                .frame(width: 80, height: 80)
            
            Text("Snorlax (Japanese: カビゴン Kabigon) is a Normal-type Pokemon. Snorlax is most popular Pokemon.")
                .font(Font.system(size: 18))
            
            Button(action: {
                withAnimation {
                    isPresent = false
                }
            }, label: {
                Text("Close")
            })
        }
        .frame(width: 280, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}
