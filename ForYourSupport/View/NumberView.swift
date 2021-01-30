//
//  NumberView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift

struct NumberView: View {
    @State var isOnToggle = false
    @State var isOnToggle2 = false
    @State var isOnToggle3 = false
    @State var number : String
    @EnvironmentObject var store: ItemStore
    @State var item: Item!
    @EnvironmentObject var numberStore: NumberStore
    @State var itemDB = ItemDB()
   
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Image(item.icon_file)
                    .resizable()
                    .frame(width:44, height: 44)
                Text(item.name)
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
                    Text("\(item.name):\(number)").font(.title)
                }
                .sheet(isPresented: $isOnToggle) {
                    ModalView(number: $number, item: Item(id: item.id, name: item.name, icon_file: item.icon_file, record_type: item.record_type, odr: item.odr))
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        self.isOnToggle2.toggle()
                    }, label: {
                        Image("graph")
                            .resizable()
                            .frame(width:50, height: 50)
                    })
                    .sheet(isPresented: $isOnToggle2) {
                        GraphView(itemStore: store, numberModel: numberStore, item: item)
                    }
                    Button(action: {
                        self.isOnToggle3.toggle()
                    }, label: {
                        Image("chart")
                            .resizable()
                            .frame(width:50, height: 50)
                    })
                    .sheet(isPresented: $isOnToggle3) {
                        NumberTypeListView(viewModel: NumberTypeListViewModel(item: item), numberStore: numberStore)
                    
                }.padding()
                
                }
                
            }
            
        }
        .background(Color(.white))
        .frame(maxWidth: .infinity)
        
    }
}

