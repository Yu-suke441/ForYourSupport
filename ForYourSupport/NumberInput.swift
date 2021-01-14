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
    @Binding var number: Int
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
            TextField("数値を入力してください", text: $number.IntToStrDef(Int(Double(number))),
                      // リターンキーが押された時の処理
                      onCommit: {
                        self.message = "あなたの\(item.name)は\(self.number)です"
                        
                        let realm = try! Realm()
                        
                       
                        
                        let item = realm.objects(ItemDB.self).filter("name == '体重(kg)'").first
                        let num = NumberDB()
                        num.id = item!.id
                        num.item_id = 2
                        num.value = Double(number)
                        num.recorded_at = Date()
                        
                        
                        try! realm.write {
                            realm.add(num, update: .all)
                            item?.numbers.append(num)
    
                        }
                        
                        
                      })
                .keyboardType(.numbersAndPunctuation)
                .padding()
            
            Text(message)
        }
        .keyboardObserving()
        
    }
}

extension Binding where Value == Int {
    func IntToStrDef(_ def: Int) -> Binding<String> {
        return Binding<String>(get: {
            return String(self.wrappedValue)
        }) { value in
            self.wrappedValue = Int(Double(value) ?? Double(def))
        }
    }
}
