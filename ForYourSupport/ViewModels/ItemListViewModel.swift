//
//  ContentViewModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import SwiftUI
import RealmSwift

class ItemListViewModel: ObservableObject {
    private var token: NotificationToken?
    private var itemModelResults = try? Realm().objects(ItemModel.self)
    @Published var itemCellViewModels: [ItemCellViewModel] = []

    init() {
        token = itemModelResults?.observe{ [weak self] _ in
            self?.itemCellViewModels = self?.itemModelResults?.map { ItemCellViewModel(id: $0.id, name: $0.name, icon_file: $0.icon_file, record_type: $0.record_type, odr: $0.odr) } ?? []
        }
    }
    deinit {
        token?.invalidate()
    }
//    @Published var id = ""
//    @Published var name = ""
//    @Published var icon_file = ""
//    @Published var record_type = ""
//    @Published var odr = 0
}


