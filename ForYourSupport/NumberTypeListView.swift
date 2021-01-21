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
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    let number = NumberDB()
    var body: some View {
        NavigationView {
            List(viewModel.numbers) { item in
                Text(String(item.value))
                    .onAppear {
                        self.viewModel.loadNext(item: item)
                    }
                
            }.onAppear {
                self.viewModel.onAppear()
            }.navigationBarTitle("検索結果")
        }
    }
}

//struct NumberTypeListView_Previews: PreviewProvider {
//    static var previews: some View {
////        NumberTypeListView(viewModel: NumberTypeListViewModel(item: ))
//        
//    }
//}
//

