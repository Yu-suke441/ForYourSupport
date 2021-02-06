//
//  SettingView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/27.
//

import SwiftUI
import RealmSwift

struct SettingView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("アプリ初期化").foregroundColor(.black)) {
                    Button(action: {
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
