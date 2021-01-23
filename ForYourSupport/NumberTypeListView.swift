//
//  NumberTypeListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/12.
//

import SwiftUI
import RealmSwift

struct NumberTypeListView: View {

    @ObservedObject var viewModel: NumberTypeListViewModel
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var numberStore: NumberStore
    
    let number = NumberDB()
    let item = ItemDB()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "MM月dd日"
       
        return  formatter
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.numbers, id: \.self) { item in
                    HStack {
                        Text(dateFormatter.string(from: item.recorded_at))
                            .font(.title3)
                        Divider()
                        Text(String(item.value))
                            .onAppear {
                                self.viewModel.loadNext(item: item)
                        }
        
                    }
                    
                    
                }.onDelete(perform: self.deleteRow)
                
                }
                .onAppear {
                    self.viewModel.onAppear()
            }
            .navigationBarTitle("\(item.name)一覧")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("戻る")
                    })
                }
            }
        }
    }
    func deleteRow(offsets: IndexSet) {
        self.viewModel.numbers.remove(atOffsets: offsets)
    }
    

     
    
}

//struct NumberTypeListView_Previews: PreviewProvider {
//    static var previews: some View {
////        NumberTypeListView(viewModel: NumberTypeListViewModel(item: ))
//        
//    }
//}
//

