//import SwiftUI
//
//struct TodoContentView: View, InputViewDelegate {
//    @State var todos: [String] = []
//    
//    var body: some View {
//        
//        ZStack(alignment: .bottomTrailing) {
//
//            List {
//                ForEach(todos, id: \.self) { todo in
//                    NavigationLink(destination: QiitaContentView(qiitaViewModel: QiitaViewModel())) {
//                    Text(todo)
//                    }
//                }
//                .onDelete(perform: delete)
//            }
//            VStack {
//                Text("TabView1")
//                NavigationLink(destination: QiitaContentView(qiitaViewModel: QiitaViewModel())) {
//                    Text("Go to SubView1")
//                }
//            }
//            NavigationLink(destination: InputView(delegate: self, text: "")) {
//                Text("追加")
//                    .foregroundColor(Color.white)
//                    .font(Font.system(size: 20))
//            }
//            .frame(width: 60, height: 60)
//            .background(Color.black)
//            .padding()
//        }
//        .onAppear {
//            if let todos = UserDefaults.standard.array(forKey: "TODO") as? [String] {
//                self.todos = todos
//            }
//        }
//        .navigationBarTitle("TODO List", displayMode: .inline)
//        .navigationBarItems(trailing: EditButton())
//    }
//    
//    func delete(at offsets: IndexSet) {
//        todos.remove(atOffsets: offsets)
//        print(todos)
//        UserDefaults.standard.setValue(todos, forKey: "TODO")
//    }
//    
//    func addTodo(text: String) {
//        todos.append(text)
//        UserDefaults.standard.setValue(todos, forKey: "TODO")
//    }
//}
//
//protocol InputViewDelegate {
//    func addTodo(text: String)
//}
//
//struct InputView: View {
//    @Environment(\.presentationMode) var presentation
//    let delegate: InputViewDelegate
//    @State var text: String
//    var body: some View {
//        VStack(spacing: 16) {
//            TextField("todoを登録してください", text: $text)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Button("Add") {
//                delegate.addTodo(text: text)
//                presentation.wrappedValue.dismiss()
//            }
//        }
//        .padding()
//    }
//}
//
////struct TodoContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        TodoContentView()
////    }
////}
