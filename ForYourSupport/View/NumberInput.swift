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
    @ObservedObject var contentViewModel: ContentViewModel
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(contentViewModel.name)) {
                    TextField("数値を入力してください", text: $number)
                        .keyboardType(.decimalPad)
                        
                    }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("\(contentViewModel.name)")
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
