//
//  NumberModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import Foundation
import RealmSwift

class NumberModel: Object, Identifiable {
    
    @objc dynamic var id = 0
    
    @objc dynamic var item_id = 0
    
    @objc dynamic var value = 0
    
    @objc dynamic var recorded_at =  Date()
    
    let itemModels = LinkingObjects(fromType: ItemModel.self, property: "numbers")
    
    override static func primaryKey() -> String? {
        return "id"
        
    }
}
