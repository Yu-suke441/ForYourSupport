//
//  SettingView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/27.
//

import SwiftUI
import RealmSwift

struct SettingView: View {
    @EnvironmentObject var store: NumberViewModel
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("アプリ初期化").foregroundColor(.black)) {
                    Button(action: {
                        
                        if let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL {
                            do {
                                store.objectWillChange.send()
                                try FileManager.default.removeItem(at: defaultRealmPath)
                                let bundleRealmPath = Bundle.main.url(forResource: "ItemList", withExtension: "realm")
                                try FileManager.default.copyItem(at: bundleRealmPath!, to: defaultRealmPath)
                                
                            } catch let error as NSError {
                                print(error)
                            }
                        }
                        
                        
                        
                    }, label: {
                        Text("アプリを初期化する")
                            .foregroundColor(.black)
                    })
                }
            }
        }
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
