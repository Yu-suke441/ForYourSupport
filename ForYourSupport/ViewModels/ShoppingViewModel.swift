//
//  ShoppingViewModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import SwiftUI
import RealmSwift

class ShoppingViewModel: ObservableObject {
    private var token: NotificationToken?
    private var shoppingModelResults = try? Realm().objects(ShoppingModel.self)
    @Published var shoppingCellViewModels: [ShoppingViewCellModel] = []
    
    init() {
        token = shoppingModelResults?.observe{[weak self] _ in
            self?.shoppingCellViewModels = self?.shoppingModelResults?.map{ ShoppingViewCellModel(id: $0.id, item_id: $0.item_id, product_name: $0.product_name, product_price: $0.product_price, recorded_date: $0.recorded_date) } ?? []
        }
    }
    deinit {
        token?.invalidate()
    }
}

//struct Shopping: Identifiable {
//    let id : String
//    let item_id: Int
//    let product_name: String
//    let product_price: Int
//    let recorded_date: Date
//
//}
//
//extension Shopping {
//    init(shoppingModel: ShoppingModel) {
//        id = shoppingModel.id
//        item_id = shoppingModel.item_id
//        product_name = shoppingModel.product_name
//        product_price = shoppingModel.product_price
//        recorded_date = shoppingModel.recorded_date
//    }
//}
