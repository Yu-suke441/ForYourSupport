//
//  CategoryView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct CategoryView: View {
    @State var number: String
    @State var itemModel: ItemModel
    var body: some View {
        if itemModel.record_type == "Number" {
            NumberView(number: number, itemModel: itemModel)
                .cornerRadius(7)
                .shadow(radius:3)
        } else if itemModel.record_type == "Memo" {
            MemoView(itemModel: itemModel)
                .cornerRadius(7)
                .shadow(radius:3)
        } else if itemModel.record_type == "Shopping" {
            ShoppingView(shoppingMoneys: 0, itemModel: itemModel)
                .cornerRadius(7)
                .shadow(radius:3)
        }
    }
}
