//
//  NumberInput.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import KeyboardObserving
import Combine
import RealmSwift



class MyData: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var score = 0 {
        willSet {
            objectWillChange.send()
        }
    }
}



struct ModalView: View {
    @Binding var number: Double
    @State var message = ""
    @EnvironmentObject var store: ItemStore
        let item: Item!
    @EnvironmentObject var numberStore: NumberStore
    var inputNumber = 0
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(item.name)) {
                    TextField("数値を入力してください", text: $number.DoubleToStrDef(Double(number)))
                        .keyboardType(.decimalPad)
                        
                    }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("\(item.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        update()
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("次へ")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                        number = 0
                    }, label: {
                        Text("キャンセル")
                    })
                }
            }
        }
    }
    func update(){
        func newID(realm: Realm) -> Int {
            if let number = realm.objects(NumberDB.self).sorted(byKeyPath: "id").last {
                return number.id + 1
            } else {
                    return 1
            }
        }
        
        
        let realm = try! Realm()
                            
        let num = NumberDB()
        let itemDB = realm.object(ofType: ItemDB.self, forPrimaryKey: item!.id)

        num.id = newID(realm: realm)
        num.item_id = item!.id
        
        num.value = self.number
        num.recorded_at = Date()
        
                        
        try! realm.write{
            itemDB?.numbers.append(num)
    //                            realm.add(num, update: .modified)
        }
    }
}



extension Binding where Value == Double {
    func DoubleToStrDef(_ def: Double) -> Binding<String> {
        return Binding<String>(get: {
            return String(self.wrappedValue)
        }) { value in
            self.wrappedValue = Double(value) ?? Double(def)
        }
    }
}
