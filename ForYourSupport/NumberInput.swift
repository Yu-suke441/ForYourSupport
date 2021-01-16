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
    var body: some View {
        
        VStack {
            HStack {
                Image(item.icon_file)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                Text(item.name)
                Spacer()
            }
            TextField("数値を入力してください", text: $number.IntToStrDef(Double(number)),
                      // リターンキーが押された時の処理
                      onCommit: {
                        self.message = "あなたの\(item.name)は\(self.number)です"
                       
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
                        
                        
                      })
                .keyboardType(.numbersAndPunctuation)
                .padding()
            
            Text(message)
        }
        .keyboardObserving()
        
    }
}

extension Binding where Value == Double {
    func IntToStrDef(_ def: Double) -> Binding<String> {
        return Binding<String>(get: {
            return String(self.wrappedValue)
        }) { value in
            self.wrappedValue = Double(value) ?? Double(def)
        }
    }
}
