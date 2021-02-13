//
//  ItemListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ItemListView: View {
    @State var items: [Item]
    @ObservedObject var model: ContentViewModel
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 1)
    var body: some View {
        
         ScrollView {
             LazyVGrid(columns: columns) {
                ForEach(model.models) { model in
                    HStack {
                        ItemRowView(itemModel: model)
                            .contextMenu(ContextMenu(menuItems: {
                                Button(action: {
                                }, label: {
                                    Text("テーブルの削除")
                                })
                            }))
                    }
                }
             }
             .padding()
             .font(.largeTitle)
         }
    }
}
