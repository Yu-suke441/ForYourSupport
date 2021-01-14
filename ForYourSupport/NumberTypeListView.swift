//
//  NumberTypeListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/12.
//

import SwiftUI
import FSCalendar

struct NumberTypeListView: View {
    @Environment(\.timeZone) var timeZone
    
    @State private var selectDate = Date()
     
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "yyyy年MM月dd日"
        formatter.timeZone = timeZone
       
        return  formatter
    }
    
    @EnvironmentObject var store: ItemStore
    let item: Item!
    
    @State var value : Int
    
    var body: some View {
        HStack {
            Text("\(selectDate, formatter: dateFormatter)")
            Spacer()
            Text("\(value)")
                .font(.title)
        }.padding()
    }
}

