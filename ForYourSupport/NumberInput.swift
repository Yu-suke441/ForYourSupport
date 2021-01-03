//
//  NumberInput.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2020/12/31.
//

import SwiftUI
import KeyboardObserving

struct NumberInput: View {
    
    @State private var showingModal = false
    
    
    var body: some View {
        Button(action: {
            self.showingModal.toggle()
        }) {
            Text("Show Modal")
        }.sheet(isPresented: $showingModal) {
            ModalView(item: Item(id: 1, name: "", icon_file: "", record_type: "", odr: 1)) // 仮コード
            
        }
    }
}

struct NumberInput_Previews: PreviewProvider {
    static var previews: some View {
        NumberInput()
    }
}

class ViewModel: ObservableObject {
    @Published var value = ""
}



struct ModalView: View {
    @State var number = ""
    @EnvironmentObject var store: ItemStore
    let item: Item!
    @ObservedObject var vm = ViewModel()
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
            TextField("数値を入力してください", text: $vm.value)
                .keyboardType(.decimalPad)
                .padding()
        }
        .keyboardObserving()
        
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        
        ModalView(item: Item(id: 1, name: "体重(kg)", icon_file: "weight-scale", record_type: "number", odr: 1)) // 仮コード
    }
}

