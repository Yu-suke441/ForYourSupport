//
//  NavigationBarView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import FSCalendar

struct NavigationBarView: View {
    @Environment(\.timeZone) var timeZone
    var item: Item
    @State private var selectDate = Date()
    @State private var showsDatePicker = false
    @State var isOnToggle = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "yyyy年MM月dd日"
        formatter.timeZone = timeZone
        return formatter
    }
    
    var body: some View {
        HStack {
            Button(action: {
                    
            }, label: {
                Text("\(selectDate, formatter: dateFormatter)")
                    .onTapGesture {
                        self.showsDatePicker.toggle()
                    }.sheet(isPresented: $showsDatePicker) {
                        CalendarView()
                    }
                    .font(.headline)
                    .padding()
            })
            
            Spacer()
            
            Button(action: {
                self.isOnToggle.toggle()
            }, label: {
                Text("設定")
                    .font(.headline)
                    .sheet(isPresented: $isOnToggle) {
                        SettingView(item: item, items: [item])
                    }
                
            })
            .font(.body)
            .padding()
        }
        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
        .foregroundColor(.white)
    
        
            
    }
}

//struct NavigationBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationBarView()
//    }
//}


struct CalendarView: UIViewRepresentable {

    var myCalendar: FSCalendar!
    
    func makeUIView(context: Context) -> UIView {
        return FSCalendar(frame: CGRect(x: 0.0, y: 40.0, width: .infinity, height: 300.0))
        
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}


