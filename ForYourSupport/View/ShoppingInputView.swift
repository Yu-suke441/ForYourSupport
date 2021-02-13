//
//  ShoppingInputView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ShoppingInputView: View {
    @State var itemModel: ItemModel
    @Binding var shoppingMenu: String
    @Binding var shoppingMoney: Int
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("買ったもの")) {
                    TextField("買ったものを入力してください", text: $shoppingMenu)
                }
                Section(header: Text("買った金額")) {
                    TextField("金額を入力しください", text: $shoppingMoney.IntToStrDef(shoppingMoney))
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("\(itemModel.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("次へ")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                        shoppingMenu = ""
                        shoppingMoney = 0
                    }, label: {
                        Text("キャンセル")
                    })
                }
            }
        }
    }
    
    
}
extension Binding where Value == Int {
    func IntToStrDef(_ def: Int) -> Binding<String> {
        return Binding<String>(get: {
            return String(self.wrappedValue)
        }) { value in
            self.wrappedValue = Int(value) ?? Int(def)
        }
    }
}
