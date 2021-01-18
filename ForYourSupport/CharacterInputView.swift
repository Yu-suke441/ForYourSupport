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
    @EnvironmentObject var memoStore: MemoStore
    let item: Item!
    @Binding var content: String
    
    var body: some View {
            VStack {
                HStack{
                    Image(item.icon_file)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                    Text(item.name)
                }
                MultilineField(text: $content, onEditingChanged: update)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0))))
                    .padding()
                    
                
                    }
                Text("\(content)")
        
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
//                            realm.add(num, update: .modified)
            }
        }
}
