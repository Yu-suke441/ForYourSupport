//
//  addNewTableView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/02/01.
//

import SwiftUI

enum Item_icon: String, CaseIterable {
    case chart
    case graph
    case detail
    case check_mark
    case heart_rate
    case meal
    case memo
    case shopping
    case task
    case thermometer
    case through
    case time_of_sleep
    case weight_scale
    
}


struct addNewTableView: View {
    var selections = ["数値入力", "テキスト入力"]
    @State private var selection = 0
    @Binding var tableName: String
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            Form {
                TextField("テーブル名", text:$tableName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Picker(selection: $selection, label: Text("アイコンの追加")) {
                    ForEach(Item_icon.allCases, id: \.self) { (item_icon) in
                        Image(item_icon.rawValue)
                            .resizable()
                            .frame(width: 45, height: 45)
                            .padding()
                    }
                }
                
                Picker(selection: $selection, label: Text("\(selection)")) {
                    ForEach(0..<selections.count) {
                        Text(self.selections[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("テーブルの追加")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                            presentation.wrappedValue.dismiss()

                    }, label: {
                        Text("キャンセル")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                            presentation.wrappedValue.dismiss()

                    }, label: {
                        Text("テーブル追加")
                    })
                }
            }
            
        }
    }
}

//struct addNewTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        addNewTableView()
//    }
//}
