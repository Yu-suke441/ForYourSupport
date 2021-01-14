//
//  NumberDB.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/09.
//

import Foundation
import RealmSwift

class NumberDB: Object {
    
    @objc dynamic var id = 0
    
    @objc dynamic var item_id = 1
    
    @objc dynamic var value:Double = 0.0
    
    @objc dynamic var recorded_at =  Date()
    
    let itemDBs = LinkingObjects(fromType: ItemDB.self, property: "numbers")
    
    override static func primaryKey() -> String? {
        return "id"
        
    }
}
