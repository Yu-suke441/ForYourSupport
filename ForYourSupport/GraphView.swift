//
//  GraphView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import SwiftUICharts

struct GraphView: View {
    let number = NumberDB()
    @State var item : ItemDB
    var body: some View {
        LineView(data: item.getNumberArray(), title: "Line chart", legend: "Full screen") // legend is optional, use optional .padding()
        
    }
}



//struct GraphView_Previews: PreviewProvider {
//    static var previews: some View {
//        GraphView()
//    }
//}
