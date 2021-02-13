//
//  CharacterInputVIew.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift

struct CharacterInputView: View {
    @ObservedObject var contentViewModel: ContentViewModel
    @State var isOnToggle = false
    @Environment(\.presentationMode) var presentation
    @Binding var content: String
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(contentViewModel.name)) {
                    TextEditor(text: $content)
                        .frame(width: UIScreen.main.bounds.width, height: 200)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white,lineWidth: 5)
                        )
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("\(contentViewModel.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("次へ")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                            presentation.wrappedValue.dismiss()
                            content = ""
                    }, label: {
                        Text("キャンセル")
                    })
                }
            }
        }
    }
}
