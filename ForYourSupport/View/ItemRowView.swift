//
//  ItemRowView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var contentViewModel: ContentViewModel
    
    var body: some View {
        CategoryView(number: "", contentViewModel: contentViewModel)
    }
}
