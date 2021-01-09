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
    var body: some View {
        VStack {
            HStack{
                Image(item.icon_file)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                Text(item.name)
            }
            HStack {
                Text("買ったもの")
                    .padding()
                Spacer()
            }
            
            TextField("買ったものを入力してください", text: $shoppingMenu)
                .padding()
            HStack {
                Text("買った金額")
                    .padding()
                Spacer()
            }
            TextField("金額を入力しください", text: $shoppingMoney)
                .keyboardType(.decimalPad)
                .padding()
        }
    }
}
