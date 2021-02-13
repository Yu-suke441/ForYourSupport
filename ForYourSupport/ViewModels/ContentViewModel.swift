//
//  ContentViewModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import SwiftUI
import RealmSwift

class ContentViewModel: ObservableObject {
    private var token: NotificationToken?
    private var myModelResults = try? Realm().objects(ItemModel.self)
    @Published var cellModels: [ContentViewCellModel] = []
    @Published var models: [ItemModel] = []
    init() {
        token = myModelResults?.observe{ [weak self] _ in
            self?.cellModels = self?.myModelResults?.map { ContentViewCellModel(id: $0.id, name: $0.name, icon_file: $0.icon_file, record_type: $0.record_type, odr: $0.odr) } ?? []
        }
    }
    deinit {
        token?.invalidate()
    }
    @Published var id = ""
    @Published var name = ""
    @Published var icon_file = ""
    @Published var record_type = ""
    @Published var odr = 0
}

struct Item: Identifiable {
    let id : String
    let name: String
    let icon_file: String
    let record_type: String
    let odr: Int
    var numbers = [Double]()
}

// Item構造体の拡張
extension Item {
    init(itemModel: ItemModel) {
        id = itemModel.id
        name = itemModel.name
        icon_file = itemModel.icon_file
        record_type = itemModel.record_type
        odr = itemModel.odr
        
        for number in itemModel.numbers {
            self.numbers.append(Double(number.value))
        }
            
    }
}

