//
//  ItemRowView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var itemModel: ItemModel
    
    var body: some View {
        CategoryView(number: "", itemModel: itemModel)
    }
}
