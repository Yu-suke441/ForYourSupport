//
//  CategoryView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct CategoryView: View {
    @State var number: String
    @ObservedObject var contentViewModel: ContentViewModel
    var body: some View {
        if contentViewModel.record_type == "Number" {
            NumberView(number: number, contentViewModel: contentViewModel)
                .cornerRadius(7)
                .shadow(radius:3)
        } else if contentViewModel.record_type == "Memo" {
            MemoView(contentViewModel: contentViewModel)
                .cornerRadius(7)
                .shadow(radius:3)
        } else if contentViewModel.record_type == "Shopping" {
            ShoppingView(shoppingMoneys: 0, contentViewModel: contentViewModel)
                .cornerRadius(7)
                .shadow(radius:3)
        }
    }
}
