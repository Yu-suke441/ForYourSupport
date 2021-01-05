//
//  NumberInput.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import KeyboardObserving
import Combine

struct NumberInput: View {
    
    @State private var showingModal = false
    @State private var value = ""
    var body: some View {
        Button(action: {
            self.showingModal.toggle()
        }) {
            Text("Show Modal")
        }.sheet(isPresented: $showingModal) {
            ModalView(number: $value, item: Item(id: 1, name: "", icon_file: "", record_type: "", odr: 1)) // 仮コード
            
        }
    }
}

struct NumberInput_Previews: PreviewProvider {
    static var previews: some View {
        NumberInput()
    }
}

class MyData: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var score = 0 {
        willSet {
            objectWillChange.send()
        }
    }
}



struct ModalView: View {
    @Binding var number : String
    @EnvironmentObject var store: ItemStore
    let item: Item!
    var body: some View {
        
        VStack {
            HStack {
                Image(item.icon_file)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                Text(item.name)
                Spacer()
            }
            TextField("数値を入力してください", text: $number)
                .keyboardType(.numbersAndPunctuation)
                .padding()
            

        }
        .keyboardObserving()
        
    }
}



