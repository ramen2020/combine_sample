//
//  contetView.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                TabBarView()
            }
            // header title
            .navigationBarTitle("Sunshine City", displayMode: .inline)
            
            // header button
            .navigationBarItems(
                trailing: HStack {
                    Button(action: {
                        print("右のボタン２が押されました。")
                    }, label: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding()
                    })
                })
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
