//import SwiftUI
//
//struct QiitaContentView: View {
//    @State private var isLoading = false // 読み込み中のローディング
//    @State private var isModalShow: Bool = false // modal遷移のflg
//    
//    @ObservedObject var qiitaViewModel: QiitaViewModel
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // 検索bar
//                SearchTextField(searchWord: $qiitaViewModel.searchWord, qiitaViewModel: qiitaViewModel)
//                // cellのview
//                QiitaCell(articleData: qiitaViewModel.articles)
//            }
//            // 背景タップでキーボード閉じる処理
//            .onTapGesture {
//                UIApplication.shared.closeKeyboard()
//            }
//            
//            // header title
//            .navigationBarTitle("Sunshine City", displayMode: .inline)
//            
//            // header button
//            .navigationBarItems(
//                trailing: HStack {
//                Button(action: {
//                    print("右のボタン２が押されました。")
//                }, label: {
//                    Image(systemName: "person.fill")
//                        .resizable()
//                        .frame(width: 22, height: 22)
//                        .padding()
//                })
//            })
//            
//            // 画面読み込み時の処理 viewdidload
//            .onAppear{
//                self.qiitaViewModel.fetchArticles()
//            }
//            
//            // footer
//            .toolbar {
//                ToolbarItemGroup(placement: .bottomBar) {
//                    VStack() {
//                        Button(action: {
//                            self.qiitaViewModel.fetchArticlesByTag(tag: "Flutter")
//                        }, label: {
//                            VStack {
//                                Image(systemName: "suit.heart.fill")
//                                    .padding(.top, 20)
//                                Text("Flutter")
//                                    .foregroundColor(.blue)
//                            }
//                        })
//                    }
//                    Spacer()
//                    Button(action: {
//                        self.qiitaViewModel.fetchArticlesByTag(tag: "Ruby")
//                    }, label: {
//                        VStack {
//                            Image(systemName: "suit.heart.fill")
//                                .padding(.top, 20)
//                            Text("Ruby")
//                                .foregroundColor(.blue)
//                        }
//                    })
//                    Spacer()
//                    FloatingButton()
//                    Spacer()
//                    Button(action: {
//                        self.qiitaViewModel.fetchArticlesByTag(tag: "AWS")
//                    }, label: {
//                        VStack {
//                            Image(systemName: "suit.heart.fill")
//                                .padding(.top, 20)
//                            Text("AWS")
//                                .foregroundColor(.blue)
//                        }
//                    })
//                    Spacer()
//                    Button(action: {
//                        self.isModalShow.toggle()
//                    }, label: {
//                        VStack {
//                            Image(systemName: "suit.heart.fill")
//                                .padding(.top, 20)
//                            Text("modal")
//                                .foregroundColor(.blue)
//                        } .sheet(isPresented: self.$isModalShow) {
//                            modalView()
//                        }
//                    })
//                }
//            }
//        }
//    }}
//
//// PreviewProvider
//struct QiitaContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        QiitaContentView(qiitaViewModel: QiitaViewModel())
//    }
//}
//
//extension UIApplication {
//    // 背景タップでキーボード閉じる処理
//    func closeKeyboard() {
//        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
//
//// FloatingButton
//struct FloatingButton: View {
//    var body: some View {
//        VStack {
//            Spacer()
//            HStack {
//                Spacer()
//                Button(action: {
//                    print("tap!!!!!")
//                }, label: {
//                    NavigationLink(destination: TodoContentView()) {
//                        Text("TODO")
//                            .foregroundColor(.white)
//                            .font(.system(size: 24))
//                    }
//                })
//                .frame(width: 80, height: 80)
//                .background(Color.orange)
//                .cornerRadius(50.0)
//                .shadow(color: .gray, radius: 3, x: 3, y: 3)
//                .padding(EdgeInsets(top: 0, leading: 0, bottom: 50.0, trailing: 16.0)) // --- 5
//                
//            }
//        }
//    }
//}
