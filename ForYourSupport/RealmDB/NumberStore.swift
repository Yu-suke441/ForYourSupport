//
//  NumberStore.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/09.
//
import SwiftUI
import RealmSwift

final class NumberStore: ObservableObject {
    
    private var numberResults: Results<NumberDB>
    
    // numberResultsにDBのデータをセット
    init(realm: Realm) {
        numberResults = realm.objects(NumberDB.self)
    }
    
    
    var numbers: [Number] {
        numberResults.map(Number.init)
    }
    
    @EnvironmentObject var store: ItemStore
    var item: Item!
    
}



extension NumberStore {
    
   
    // データ追加
    func create(item_id: Int, value: Double, recorded_at: Date) {
        objectWillChange.send()
        
                
        do {
            let realm = try! Realm()
            let itemDB = ItemDB()
            
            let numberDB = NumberDB()
            numberDB.id = newID(realm: realm)
            numberDB.item_id = item_id
            numberDB.value = value
            numberDB.recorded_at = recorded_at
            
            try! realm.write {
                
                itemDB.numbers.append(numberDB)
                realm.add(numberDB)
            }
            
        } catch let err {
            print(err.localizedDescription)
        }
            
        
    }
    
    func newID(realm: Realm) -> Int {
        if let number = realm.objects(NumberDB.self).sorted(byKeyPath: "id").last {
            return number.id + 1
        } else {
                return 1
        }
    }

        
    
    
    func update(number: Number) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(NumberDB.self,
                             value: [
                                NumberDBKeys.id.rawValue: number.id,
                                NumberDBKeys.item_id.rawValue: number.item_id,
                                NumberDBKeys.value.rawValue: number.value,
                                NumberDBKeys.recorded_at.rawValue: number.recorded_at,
                                
                            
                             ],
                             update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func delete(numberID: Int) {
        objectWillChange.send()
        
        guard let numberDB = numberResults.first(where: {$0.id == numberID}) else {
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(numberDB)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func update(id: Int) {
        objectWillChange.send()

        do {
          let realm = try Realm()
          try realm.write {
            realm.create(ItemDB.self,
                         value: ["id": id
                         ],
                         update: .modified)
          }
        } catch let error {
          print(error.localizedDescription)
        }
    }
    
}




