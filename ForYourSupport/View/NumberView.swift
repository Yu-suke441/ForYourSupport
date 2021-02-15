//
//  NumberView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct NumberView: View {
    
    @State private var isOnToggle = false
    @State private var isOnGraphToggle = false
    @State private var isOnChartToggle = false
    @State var number = ""
    var itemCellViewModel : ItemCellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(itemCellViewModel.icon_file)
                    .resizable()
                    .frame(width:44, height: 44)
                Text(itemCellViewModel.name)
                    .font(.title)
                    .lineLimit(1)
                    .foregroundColor(.black)
                Spacer()
            }.padding()
            
            HStack {
                Spacer()
                Button(action: {
                    self.isOnToggle.toggle()
                }, label: {
                    Text("\(itemCellViewModel.name):\(number)").font(.title)
                })
                .sheet(isPresented: $isOnToggle, content: {
                    NumberInputView(number: $number, itemCellViewModel: itemCellViewModel)
                })
                
                Spacer()
                
                VStack {
                    Button(action: {
                        self.isOnGraphToggle.toggle()
                    }, label: {
                        Image("graph")
                            .resizable()
                            .frame(width:50, height: 50)
                    })
                    .sheet(isPresented: $isOnGraphToggle) {
                        GraphView()
                    }
                    Button(action: {
                        self.isOnChartToggle.toggle()
                    }, label: {
                        Image("chart")
                            .resizable()
                            .frame(width:50, height: 50)
                    })
                    .sheet(isPresented: $isOnChartToggle) {
                    }
                }.padding()
            }
        }
        .background(Color(.white))
        .frame(maxWidth: .infinity)
    }
}

//struct NumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberView()
//    }
//}
