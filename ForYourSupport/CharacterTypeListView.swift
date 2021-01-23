//
//  CharacterTypeListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/22.
//

import SwiftUI

struct CharacterTypeListView: View {
    @ObservedObject var viewModel: CharacterTypeViewModel
    @Environment(\.presentationMode) var presentation
    let memo = MemoDB()
    let item = ItemDB()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "dd日"
       
        return  formatter
    }
    var body: some View {
        NavigationView {
            List(viewModel.memos) { item in
                HStack {
                    Text(dateFormatter.string(from: item.recorded_date))
                        .font(.title3)
                    Divider()
                    Text(String(item.memo))
                        .onAppear {
                            self.viewModel.loadNext(item: item)
                    }
                }
                
            }.onAppear {
                self.viewModel.onAppear()
            }.navigationBarTitle("\(item.name)一覧")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("戻る")
                    })
                }
            }
        }
    }
}


//struct CharacterTypeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterTypeListView()
//    }
//}
