//
//  MemoDB.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/09.
//

import Foundation
import RealmSwift

class MemoDB: Object {
    @objc dynamic var id = 0
    
    @objc dynamic var item_id = 2
    
    @objc dynamic var memo = ""
    
    @objc dynamic var recorded_date = Date()
    
    @objc dynamic var owner: ItemDB?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
