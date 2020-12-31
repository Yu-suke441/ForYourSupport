//
//  GraphView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import SwiftUICharts

struct GraphView: View {
    var body: some View {
        LineView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Full screen") // legend is optional, use optional .padding()
        
    }
}



struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
