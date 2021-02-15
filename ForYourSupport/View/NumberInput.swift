//
//  NumberInput.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift

struct NumberInputView: View {
    @Binding var number: String
    @Environment(\.presentationMode) var presentation
    var itemCellViewModel: ItemCellViewModel
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(itemCellViewModel.name)) {
                    TextField("数値を入力してください", text: $number)
                        .keyboardType(.decimalPad)
                        
                    }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("\(itemCellViewModel.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        let myModel = NumberModel()
                        myModel.recorded_at = Date()
                        let realm = try? Realm()
                        try? realm?.write {
                            realm?.add(myModel)
                            print(myModel)
                        }
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("次へ")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                        number = ""
                    }, label: {
                        Text("キャンセル")
                    })
                }
            }
        }
    }
    
    func update(){
        func newID(realm: Realm) -> Int {
            if let number = realm.objects(NumberModel.self).sorted(byKeyPath: "id").last {
                return number.id + 1
            } else {
                    return 1
            }
        }
        
        
        let realm = try! Realm()
        let itemModel = ItemModel()
        let num = NumberModel()
        let itemDB = realm.object(ofType: ItemModel.self, forPrimaryKey: itemModel.id)

        num.id = newID(realm: realm)
        num.item_id = num.id
        
        num.value = Int(number)!
        num.recorded_at = Date()
        
                        
        try! realm.write{
            itemDB?.numbers.append(num)
            //realm.add(num, update: .modified)
        }
    }
    
}



//extension Binding where Value == Double {
//    func DoubleToStrDef(_ def: Double) -> Binding<String> {
//        return Binding<String>(get: {
//            return String(self.wrappedValue)
//        }) { value in
//            self.wrappedValue = Double(value) ?? Double(def)
//        }
//    }
//}
