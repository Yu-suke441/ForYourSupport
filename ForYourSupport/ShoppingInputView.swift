//
//  ShoppingInputView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI


struct ShoppingInputView: View {
    @EnvironmentObject var store: ItemStore
    let item: Item!
    @Binding var shoppingMenu: String
    @Binding var shoppingMoney: String
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("買ったもの")) {
                    TextField("買ったものを入力してください", text: $shoppingMenu)
                }
                Section(header: Text("買った金額")) {
                    TextField("金額を入力しください", text: $shoppingMoney)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("\(item.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("次へ")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("キャンセル")
                    })
                }
            }
        }
    }
}
