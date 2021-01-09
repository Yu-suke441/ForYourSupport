//
//  ContentView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @EnvironmentObject var store: ItemStore

    var body: some View {
        VStack(spacing: 0) {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).edgesIgnoringSafeArea(.top).frame(height:0)
                
            NavigationBarView()
            ItemListView(items: store.items)
                
            .padding()
        }.background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
        .onAppear() {
            print(Realm.Configuration.defaultConfiguration.fileURL)
            
            
            
            
        }
        
        
         
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

