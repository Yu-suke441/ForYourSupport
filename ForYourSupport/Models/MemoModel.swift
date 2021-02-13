//
//  MemoModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import Foundation
import RealmSwift

class MemoModel: Object,Identifiable {
    @objc dynamic var id = UUID().uuidString
    
    @objc dynamic var item_id = 1
    
    @objc dynamic var memo = ""
    
    @objc dynamic var recorded_date = Date()
    
    let itemModels = LinkingObjects(fromType: ItemModel.self, property: "memos")
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
