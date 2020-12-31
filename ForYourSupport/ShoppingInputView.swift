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
    @State var shoppingMenu = ""
    @State var shoppingMoney = ""
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

struct ShoppingInputView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingInputView(item: Item(id: 1, name: "", icon_file: "", record_type: "", odr: 1))
    }
}
