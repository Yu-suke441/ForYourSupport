//
//  MemoViewModel.swift
//  YourSupport
//
//  Created by Yusuke Murayama on 2021/02/09.
//

import SwiftUI
import RealmSwift

class MemoViewModel: ObservableObject {
    private var token: NotificationToken?
    private var memoModelResults = try? Realm().objects(MemoModel.self)
    @Published var memoCellViewModels: [MemoViewCellModel] = []
    
    init() {
        token = memoModelResults?.observe{[weak self] _ in
            self?.memoCellViewModels = self?.memoModelResults?.map{ MemoViewCellModel(id: $0.id, item_id: $0.item_id, memo: $0.memo, recorded_date: $0.recorded_date) } ?? []
        }
    }
    deinit {
        token?.invalidate()
    }
}

//struct Memo: Identifiable {
//    let id : String
//    let item_id: Int
//    let memo : String
//    let recorded_date: Date
//
//}
//
//extension Memo {
//    init(memoModel: MemoModel) {
//        id = memoModel.id
//        item_id = memoModel.item_id
//        memo = memoModel.memo
//        recorded_date = memoModel.recorded_date
//        
//    }
//}
