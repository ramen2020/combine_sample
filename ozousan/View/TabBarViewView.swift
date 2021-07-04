////
////  TabView.swift
////  ozousan
////
////  Created by 宮本光直 on 2021/06/22.
////
//
//import SwiftUI
//
//struct TabBarView: View {
//    @State private var isModalShow = false
//
//    var body: some View {
//        TabView{
//            GridTestView(pixabayViewModel: PixabayViewModel())
//                .tabItem {
//                    Label("search", systemImage: "magnifyingglass")
//                }
//
//            QiitaContentView(qiitaViewModel: QiitaViewModel())
//                .tabItem {
//                    Label("home", systemImage: "house")
//                }
//
//            Spacer()
//
//            ThirdView(pixabayViewModel: PixabayViewModel())
//                .tabItem {
//                    Label("bookmark", systemImage: "bookmark")
//                }
//
//            FourthView()
//                .tabItem {
//                    Label("member", systemImage: "person.fill")
//                }
//        }.overlay(
//            Button {
//                self.isModalShow.toggle()
//            } label: {
//                ZStack {
//                    Circle()
//                        .foregroundColor(.white)
//                        .frame(width: 80, height: 80)
//                        .shadow(radius: 2)
//                    Image(systemName: "qrcode")
//                        .resizable()
//                        .foregroundColor(.primary)
//                        .frame(width: 50, height: 50)
//                }
//            }
//            .sheet(isPresented: $isModalShow) {TodoContentView()}
//            .buttonStyle(CustomTabButtonStyle())
//            ,alignment: .bottom
//        )
//    }
//}
//// クリック時に揺れるボタン
//struct CustomTabButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration
//            .label
//            .opacity(configuration.isPressed ? 0.7 : 1)
//            .scaleEffect(configuration.isPressed ? 0.98 : 1)
//    }
//}
//
//
//struct FirstView: View {
//    var body: some View {
//        Color(.systemGray6)
//            .ignoresSafeArea()
//            .navigationTitle("first")
//    }
//}
//
//
//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
//
