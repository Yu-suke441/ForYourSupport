//
//  ShoppingTypeListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/22.
//

import SwiftUI

struct ShoppingTypeListView: View {
    @ObservedObject var viewModel: ShoppingTypeListViewModel
    @Environment(\.presentationMode) var presentation
    @State private var selectDate = Date()
    let item = ItemDB()
    let shoppingDB = ShoppingDB()
    
    let dt = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "dd日"
       
        return  formatter
    }
    
    
    var body: some View {
        NavigationView {
            List(viewModel.shoppings) { item in
                HStack {
                    Text(dateFormatter.string(from: item.recorded_date))
                        .font(.title3)
                    Divider()
                    Text(String(item.product_name))
                    Spacer()
                    Text(String("\(item.product_price)円"))
                        .onAppear {
                            self.viewModel.loadNext(item: item)
                           
                    }
                    
                }

            }.onAppear {
                self.viewModel.onAppear()
            }.navigationBarTitle("\(item.name)一覧")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("戻る")
                    })
                }
            }
        }
    }
}
//struct ShoppingTypeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingTypeListView()
//    }
//}
