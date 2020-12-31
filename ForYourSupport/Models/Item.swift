//
//  Item.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import Foundation


struct Item: Identifiable {
    let id : Int
    let name: String
    let icon_file: String
    let record_type: String
    let odr: Int
}

extension Item {
    init(itemDB: ItemDB) {
        id = itemDB.id
        name = itemDB.name
        icon_file = itemDB.icon_file
        record_type = itemDB.record_type
        odr = itemDB.odr
    }
}
