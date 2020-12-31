//
//  ItemStore.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift

final class ItemStore: ObservableObject {
    
    private var itemResults: Results<ItemDB>!
    
    init(realm: Realm) {
        itemResults = realm.objects(ItemDB.self)
    }
    
    
    
    var items: [Item] {
         itemResults.map(Item.init)
    }
    
}

extension ItemStore {
    // データ追加
    func create(name: String, icon_file: String, record_type: String, odr: Int) {
        objectWillChange.send()
        
        do {
            let realm = try! Realm()
            let itemDB = ItemDB()
            itemDB.id = UUID().hashValue
            itemDB.name = name
            itemDB.icon_file = icon_file
            itemDB.record_type = record_type
            itemDB.odr = odr
            try! realm.write {
                realm.add(itemDB)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func update(item: Item) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(ItemDB.self,
                             value: [
                                ItemDBKeys.id.rawValue: item.id,
                                ItemDBKeys.name.rawValue: item.name,
                                ItemDBKeys.icon_file.rawValue: item.icon_file,
                                ItemDBKeys.record_type.rawValue: item.record_type,
                                ItemDBKeys.odr.rawValue: item.odr
                            
                             ],
                             update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func delete(itemID:Int) {
        objectWillChange.send()
        
        guard let itemDB = itemResults.first(where: {$0.id == itemID}) else {
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(itemDB)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func update(id: String, order: Int) {
        objectWillChange.send()

        do {
          let realm = try Realm()
          try realm.write {
            realm.create(ItemDB.self,
                         value: ["id": id,
                                 "order": order],
                         update: .modified)
          }
        } catch let error {
          print(error.localizedDescription)
        }
    }
    
}




