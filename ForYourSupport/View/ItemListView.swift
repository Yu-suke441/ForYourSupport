//
//  ItemListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ItemListView: View {
    @State var items: [Item]
    @ObservedObject var contentViewModel: ContentViewModel
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 1)
    var body: some View {
        
         ScrollView {
             LazyVGrid(columns: columns) {
                ForEach(contentViewModel.models, id: \.id) { model in
                    HStack {
                        ItemRowView(contentViewModel: contentViewModel)
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
