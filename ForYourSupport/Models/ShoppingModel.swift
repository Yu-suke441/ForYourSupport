//
//  ShoppingModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import Foundation
import RealmSwift

class ShoppingModel: Object ,Identifiable{
    @objc dynamic var id = UUID().uuidString
    
    @objc dynamic var item_id = 2
    
    @objc dynamic var product_name = ""
    
    @objc dynamic var product_price = 0
    
    @objc dynamic var recorded_date = Date()
    
    let itemModels = LinkingObjects(fromType: ItemModel.self, property: "shoppings")
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
