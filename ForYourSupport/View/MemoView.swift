//
//  MemoView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI

struct MemoView: View {
    var itemCellViewModel: ItemCellViewModel
    @State var isOnToggle = false
    @State var isOnChartToggle = false
    @State var contents = ""
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
                }) {
                    Text("\(itemCellViewModel.name):\(contents)")
                        .font(.title)
                        .lineLimit(1)
                }
//                .sheet(isPresented: $isOnToggle) {
//                    CharacterInputView(contentViewModel: contentViewModel, content: $contents)
//                }
                
                Spacer()
                
                Button(action: {
                    self.isOnChartToggle.toggle()
                }, label: {
                    Image("chart")
                        .resizable()
                        .frame(width:50, height: 50)
                })
                .padding()
//                .sheet(isPresented: $isOnChartToggle) {
//                    CharacterInputView(contentViewModel: contentViewModel, content: $contents)
//                }
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
