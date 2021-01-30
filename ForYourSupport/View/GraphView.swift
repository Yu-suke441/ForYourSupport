//
//  GraphView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import SwiftUICharts
import RealmSwift

struct GraphView: View {
    
    let number = NumberDB()
    let realm = try! Realm()
    @State var itemDB = ItemDB()
    @ObservedObject var itemStore: ItemStore
    @ObservedObject var numberModel: NumberStore
    var item: Item!
    @State var numberDB = NumberDB()
    var body: some View {
        LineView(data: itemDB.getNumberArray(), title: "\(item.name)")
        // legend is optional, use optional .padding()
        
    }
}



//struct GraphView_Previews: PreviewProvider {
//    static var previews: some View {
//        GraphView(item: )
//    }
//}
