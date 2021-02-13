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
    @State var number: String
    @State var itemModel: ItemModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(itemModel.icon_file)
                    .resizable()
                    .frame(width:44, height: 44)
                Text(itemModel.name)
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
                    Text("\(itemModel.name):\(number)").font(.title)
                })
                .sheet(isPresented: $isOnToggle, content: {
                    NumberInputView(number: $number, itemModel: itemModel)
                })
            }
        }
    }
}

//struct NumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberView()
//    }
//}
