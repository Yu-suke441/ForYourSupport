//
//  ItemModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import Foundation
import RealmSwift


class ItemModel: Object, Identifiable{
    @objc dynamic var id = UUID().uuidString
    
    @objc dynamic var name = ""
    
    @objc dynamic var icon_file = ""
    
    @objc dynamic var record_type = ""
    
    @objc dynamic var odr = 0
    
    let numbers = List<NumberModel>()
    
    let memos = List<MemoModel>()
    
    let shoppings = List<ShoppingModel>()

    // 主キーを使うとデータの更新や削除で使える
    override static func primaryKey() -> String? {
        return "id"
    }
}

