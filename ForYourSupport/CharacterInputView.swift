//
//  CharacterInputVIew.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import RealmSwift

struct MultilineField: UIViewRepresentable {
    @Binding var text: String

    let onEditingChanged: (Bool) -> Void

    init(text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = {_ in}) {
        self._text = text
        self.onEditingChanged = onEditingChanged
    }

    func makeCoordinator() -> MultilineFieldCoordinator {
        MultilineFieldCoordinator(target: self, onEditingChanged: onEditingChanged)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        if textView.text != text {
            textView.text = text
        }
    }
}

class MultilineFieldCoordinator : NSObject, UITextViewDelegate {
    let target: MultilineField
    let onEditingChanged: (Bool) -> Void

    init(target: MultilineField, onEditingChanged: @escaping (Bool) -> Void = {_ in}) {
        self.target = target
        self.onEditingChanged = onEditingChanged
    }

    func textViewDidChange(_ textView: UITextView) {
        target.text = textView.text
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        onEditingChanged(true)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        onEditingChanged(false)
    }
}






struct CharacterInputView: View {
//    @State var content = ""
    @EnvironmentObject var store: ItemStore
    @ObservedObject var memoStore: MemoStore
    let item: Item!
    let memo: Memo!
    @State var isOnToggle = false
    @Environment(\.presentationMode) var presentation
    @Binding var content: String
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text(item.name)) {
                    TextEditor(text: $content)
                        .frame(width: UIScreen.main.bounds.width, height: 200)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red,lineWidth: 5)
                        )
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("\(item.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        update(changed: false)
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("次へ")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("キャンセル")
                    })
                }
            }
        }
    }

    func update(changed: Bool) {
        guard !changed else { return }
        func newID(realm: Realm) -> Int {
            if let number = realm.objects(MemoDB.self).sorted(byKeyPath: "id").last {
                return number.id + 1
            } else {
                    return 1
            }
        }
                    
                
        let realm = try! Realm()
                                
        let memoDB = MemoDB()
        let itemDB = realm.object(ofType: ItemDB.self, forPrimaryKey: item!.id)
        
        memoDB.id = newID(realm: realm)
        memoDB.item_id = item!.id
                
        memoDB.memo = self.content
        memoDB.recorded_date = Date()
                    
                                    
        try! realm.write{
            itemDB?.memos.append(memoDB)
            //realm.add(num, update: .modified)
        }
    }
}
