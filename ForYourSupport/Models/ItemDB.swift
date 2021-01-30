//
//  ItemDB.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import Foundation
import RealmSwift

class ItemDB: Object{
    @objc dynamic var id = 0
    
    @objc dynamic var name = ""
    
    @objc dynamic var icon_file = ""
    
    @objc dynamic var record_type = ""
    
    @objc dynamic var odr = 0
    
    let numbers = List<NumberDB>()
    
    let memos = List<MemoDB>()
    
    let shoppings = List<ShoppingDB>()

    func getNumberArray() -> [Double] {
        var numberArray = [Double]()

        for number in numbers {
            numberArray.append(number.value)
        }
        return numberArray
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}




