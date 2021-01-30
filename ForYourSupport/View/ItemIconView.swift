//
//  ItemIconView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/27.
//

import SwiftUI

struct ItemIconView: View {
    @ObservedObject var store: ItemStore
    let item: Item!
    var body: some View {
        VStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(item.icon_file)
            })
            Text("\(item.name)")
        }
    }
}

//struct ItemIconView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemIconView()
//    }
//}
