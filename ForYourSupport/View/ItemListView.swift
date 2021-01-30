//
//  ItemListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var store: ItemStore
    let items: [Item]
    
    @EnvironmentObject var store2: NumberStore
    let numbers: [Number]
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 1)
    var body: some View {
        
         ScrollView {
             LazyVGrid(columns: columns) {
                ForEach(items) { item in
                    HStack {
                        ItemRowView(item: item)
                    }
                    
                }
             }.font(.largeTitle)
         }
        
    }
}
