//
//  ItemListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var itemListViewModel = ItemListViewModel()
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 1)
    var body: some View {
        
         ScrollView {
             LazyVGrid(columns: columns) {
                ForEach(itemListViewModel.itemCellViewModels, id: \.id) { itemCellViewModel in
                    
                        ItemCellView(itemCellViewModel: itemCellViewModel)
                            .contextMenu(ContextMenu(menuItems: {
                                Button(action: {
                                }, label: {
                                    Text("テーブルの削除")
                                })
                            }))
    
                }
             }
             .padding()
             .font(.largeTitle)
         }
    }
}
