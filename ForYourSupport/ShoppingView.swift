//
//  ShoppingView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift

struct ShoppingView: View {
    @State var isOnToggle = false
    @EnvironmentObject var store: ItemStore
    let item: Item!
    @ObservedObject var vm3 = ViewModel3()
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
                    VStack {
                        Text("買ったものは\(vm3.shoppingMenu)").font(.title)
                        Text("買った金額は\(vm3.shoppingMoney)").font(.title)
                    }
                })
                .sheet(isPresented: $isOnToggle) {
                    ShoppingInputView(item: Item(id: item.id, name: item.name, icon_file: item.icon_file, record_type: item.record_type, odr: item.odr))
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

struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView(item: Item(id: 1, name: "", icon_file: "", record_type: "", odr: 1))
    }
}

