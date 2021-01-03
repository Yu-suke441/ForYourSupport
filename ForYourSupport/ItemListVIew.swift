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
    
    
    var body: some View {
        var columns: [GridItem] =
                 Array(repeating: .init(.flexible()), count: 1)
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
