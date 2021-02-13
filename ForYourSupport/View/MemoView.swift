//
//  MemoView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct MemoView: View {
    @State var itemModel: ItemModel
    @State var isOnToggle = false
    @State var isOnChartToggle = false
    @State var contents = ""
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
                }) {
                    Text("\(itemModel.name):\(contents)")
                        .font(.title)
                        .lineLimit(1)
                }
                .sheet(isPresented: $isOnToggle) {
                    CharacterInputView(itemModel: itemModel, content: $contents)
                }
                
                Spacer()
                
                Button(action: {
                    self.isOnChartToggle.toggle()
                }, label: {
                    Image("chart")
                        .resizable()
                        .frame(width:50, height: 50)
                })
                .padding()
                .sheet(isPresented: $isOnChartToggle) {
                    CharacterInputView(itemModel: itemModel, content: $contents)
                }
            }
        }
        .background(Color(.white))
        .frame(maxWidth: .infinity)
    }
}

//struct MemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoView(item: Item(id: 1, name: "", icon_file: "", record_type: "", odr: 1))
//    }
//}
