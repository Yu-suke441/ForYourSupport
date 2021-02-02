//
//  ItemRowView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ItemRowView: View {
   
    let item: Item
    
    var body: some View {
        CategoryView(item: item, number: "")
        
    }
}
