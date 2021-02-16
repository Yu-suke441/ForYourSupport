//
//  ContentViewCellModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import SwiftUI

struct ItemCellViewModel:Identifiable {
    let id: String
    let name: String
    let icon_file: String
    let record_type: String
    let odr: Int
}

// Item構造体の拡張
extension ItemCellViewModel {
    init(itemModel: ItemModel) {
        id = itemModel.id
        name = itemModel.name
        icon_file = itemModel.icon_file
        record_type = itemModel.record_type
        odr = itemModel.odr
        
//        for number in itemModel.numbers {
//            self.numbers.append(number.value)
//        }
            
    }
}
