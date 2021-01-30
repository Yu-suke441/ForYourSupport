//
//  SettingView.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/27.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var store: ItemStore
    let item: Item!
    let items: [Item]
    @Environment(\.presentationMode) var presentation
    @State private var isOn = false
    var body: some View {
        NavigationView{
            List{
                VStack {
                    HStack{
                        VStack(alignment: .leading) {
                            Text("タップ:表示/非表示").foregroundColor(.black).font(.title2)
                            
                        }
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("detail")
                                .resizable()
                                .frame(width:60, height: 60)
                                .foregroundColor(.blue)
                            Text("ユーザー設定")
                                .foregroundColor(.black)
                        })
                        
                    }
                    .padding()
                    Divider()
                    VStack {
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                if isOn == true {
                                    Image("weight-scale")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                } else if isOn == false {
                                    Image("weight-scale")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        
                                        
                                }
                                Text("体重")
                                    .foregroundColor(.black)
                            })
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("thermometer")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                Text("体温")
                                    .foregroundColor(.black)
                            })
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("time-of-sleep")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                Text("睡眠時間")
                                    .foregroundColor(.black)
                            })
                        }.padding()
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("memo")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                Text("メモ")
                                    .foregroundColor(.black)
                            })
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("shopping")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                Text("買い物")
                                    .foregroundColor(.black)
                            })
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("heart-rate")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                Text("心拍数")
                                    .foregroundColor(.black)
                            })
                        }.padding()
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("meal")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                Text("食事")
                                    .foregroundColor(.black)
                            })
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("through")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                Text("お通じ")
                                    .foregroundColor(.black)
                            })
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("check-mark")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                Text("一日一善")
                                    .foregroundColor(.black)
                            })
                        }.padding()
                    }
                }
                
            }
            .listStyle(GroupedListStyle())
            .foregroundColor(.white)
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("戻る")
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
