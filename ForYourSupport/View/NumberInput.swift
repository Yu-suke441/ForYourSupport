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
    let itemCellViewModel: ItemCellViewModel
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
//                        let myModel = NumberModel()
//                        myModel.recorded_at = Date()
//                        let realm = try? Realm()
//                        try? realm?.write {
//                            realm?.add(myModel)
//                            print(myModel)
//                        }
                        update()
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
            if let number = realm.objects(NumberModel.self).sorted(byKeyPath: "id", ascending: true).last {
                return number.id + 1
            } else {
                    return 1
            }
        }
        
        
        let realm = try! Realm()
        let num = NumberModel()
        let itemModel = realm.object(ofType: ItemModel.self, forPrimaryKey: itemCellViewModel.id)

        num.id = newID(realm: realm)
        num.item_id = num.id
        
        num.value = Int(atof(number))
        num.recorded_at = Date()
        
                        
        try! realm.write{
            itemModel!.numbers.append(num)
            //realm.add(num, update: .modified)
            print(num)
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
