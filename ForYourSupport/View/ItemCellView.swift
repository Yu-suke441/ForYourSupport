//
//  ItemRowView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ItemCellView: View {
    let itemCellViewModel: ItemCellViewModel
    @ObservedObject var numberTypeListViewModel: NumberTypeListViewModel
    var body: some View {
        if itemCellViewModel.record_type == "Number" {
            NumberView(itemCellViewModel: itemCellViewModel, numberTypeListViewModel: numberTypeListViewModel)
                .cornerRadius(7)
                .shadow(radius:3)
        } else if itemCellViewModel.record_type == "Memo" {
            MemoView(itemCellViewModel: itemCellViewModel)
                .cornerRadius(7)
                .shadow(radius:3)
        } else if itemCellViewModel.record_type == "Shopping" {
            ShoppingView(shoppingMoneys: 0, itemCellViewModel: itemCellViewModel)
                .cornerRadius(7)
                .shadow(radius:3)
        }
    }
}
