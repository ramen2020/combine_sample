//
//  ContentView.swift
//  SwiftUI Architecture
//
//  Created by 宮本光直 on 2021/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                QiitaContentView()
                    .tabItem {
                        Label("qiita", systemImage: "gamecontroller")
                    }
                
                QiitaFavoriteContentView()
                    .tabItem {
                        Label("favorite", systemImage: "star")
                    }
                
                WebView(urlString: "")
                    .tabItem {
                        Label("webview", systemImage: "star")
                    }
            }
            .environmentObject(QiitaViewModel())
            .navigationBarTitle("Article List", displayMode: .inline)
            .navigationBarItems(
                trailing: HStack {
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding()
                    })
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
