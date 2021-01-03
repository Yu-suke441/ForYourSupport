//
//  NumberTypeListView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
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
        return formatter
    }
    
    
    var body: some View {
        VStack {
            CalendarController()
                .frame(height: 200)
            Divider()
            HStack {
                Text("\(selectDate, formatter: dateFormatter)")
                    .padding()
                Spacer()
            }
            .padding()
            
        }
        Spacer()
    
    }
}



struct NumberTypeListView_Previews: PreviewProvider {
    static var previews: some View {
        NumberTypeListView()
    }
}

class calendars: UIViewController, FSCalendarDelegate{
    var calendar = FSCalendar()

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendar.scope = .week
        calendar.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 200)
        view.addSubview(calendar)
    }
}

struct CalendarController: UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<CalendarController>) -> calendars {
        return calendars()
    }

    func updateUIViewController(_ uiViewController: calendars, context: UIViewControllerRepresentableContext<CalendarController>) {
        
    }

}

struct CalendarController_Previews:PreviewProvider  {
    static var previews: some View {
        CalendarController()
    }
}

