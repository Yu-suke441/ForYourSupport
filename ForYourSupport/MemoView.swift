//
//  MemoView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift

struct MemoView: View {
    @State var isOnToggle = false
    @EnvironmentObject var store: ItemStore
    let item: Item!
    @ObservedObject var vm2 = ViewModel2()
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(item.icon_file)
                    .resizable()
                    .frame(width:44, height: 44)
                    
                Text(item.name)
                    .font(.title)
                    .lineLimit(1)
                Spacer()
                
            }.padding()
            
            HStack {
                Spacer()
                Button(action: {
                    self.isOnToggle.toggle()
                }, label: {
                    Text("今日の:\(vm2.content)").font(.title)
                })
                .sheet(isPresented: $isOnToggle) {
                    CharacterInputView(item: Item(id: item.id, name: item.name, icon_file: item.icon_file, record_type: item.record_type, odr: item.odr))
                }
                
                Spacer()
                
                
                    
                    Button(action: {}, label: {
                        Image("chart")
                            .resizable()
                            .frame(width:50, height: 50)
                    })
                    .padding()
                    
                
                
                
            }
            
        }
        .background(Color(.red))
        .frame(maxWidth: .infinity)
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView(item: Item(id: 1, name: "", icon_file: "", record_type: "", odr: 1))
    }
}
