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
    func create(item_id: Int, value: Float, recorded_at: Date) {
        objectWillChange.send()
        let realm = try! Realm()
            try! realm.write {
                
                let itemDB = ItemDB()
                
                let numberDB = NumberDB()
                numberDB.id = UUID().hashValue
                numberDB.item_id = item_id
                numberDB.value = Double(value)
                numberDB.recorded_at = recorded_at
                
                
                itemDB.numbers.append(numberDB)
                
                realm.add(itemDB)
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
    
    func delete(numberDB:Int) {
        objectWillChange.send()
        
        guard let numberDB = numberResults.first(where: {$0.id == numberDB}) else {
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




