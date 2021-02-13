//
//  NumberViewModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import SwiftUI
import RealmSwift

class NumberViewModel: ObservableObject {
    private var token: NotificationToken?
    private var myModelResults = try? Realm().objects(NumberModel.self)
    @Published var numberCellModels: [NumberViewCellModel] = []
    
    init() {
        token = myModelResults?.observe{[weak self] _ in
            self?.numberCellModels = self?.myModelResults?.map{ NumberViewCellModel(id: $0.id, item_id: $0.item_id, value: Double($0.value),recorded_at: $0.recorded_at) } ?? []
        }
    }
    deinit {
        token?.invalidate()
    }
    
    
}
//struct NumberViewModel: Identifiable {
//    let id : String
//    let item_id: Int
//    let value :Double
//    let recorded_at: Date
//    
//}
//
//extension Number {
//    init(numberModel: NumberModel) {
//        id = numberModel.id
//        item_id = numberModel.item_id
//        value = Double(numberModel.value)
//        recorded_at = numberModel.recorded_at
//           
//    }
//}
//
//
