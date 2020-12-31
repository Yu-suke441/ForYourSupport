//
//  CategoryView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift




struct CategoryView: View {
    @EnvironmentObject var store: ItemStore
    let item: Item!
    var body: some View {
        if item.record_type == "number" {
            NumberView(item: item)
        } else if item.record_type == "memo" {
            MemoView(item: item)
        } else if item.record_type == "shopping" {
            ShoppingView(item: item)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
        CategoryView(item: Item(id: 0, name: "体重(kg)", icon_file: "weight-scale", record_type: "number", odr: 0))
        CategoryView(item: Item(id: 1, name: "体温(℃)", icon_file: "thermometer", record_type: "number" , odr: 1))
        CategoryView(item: Item(id: 2, name: "メモ", icon_file: "memo", record_type: "memo" , odr: 2))
        CategoryView(item: Item(id: 3, name: "買い物(円)", icon_file: "shopping", record_type: "shopping" , odr: 3))
        CategoryView(item: Item(id: 4, name: "一日一善", icon_file: "check-mark", record_type: "memo" , odr: 4))
        }
    }
}
