//
//  NumberTypeListViewModel.swift
//  ForYourSupport
//
//  Created by Yusuke Murayama on 2021/01/14.
//

import Combine
import Foundation
import RealmSwift

extension RandomAccessCollection where Self.Element: Identifiable {
    public func isLastItem<Item: Identifiable>(_ item: Item) -> Bool {
        guard !isEmpty else {
            return false
        }

        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }

        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
}



final class NumberTypeListViewModel: ObservableObject {
    @Published var numbers: [NumberModel] = []
    @Published var isLoading = false
    let itemCellViewModel: ItemCellViewModel!
    var numberTables: Results<NumberModel>!
    
    private var cancellables: Set<AnyCancellable> = []

    private let perPage = 20
    private var currentPage = 1
    init(item: ItemCellViewModel) {
        self.itemCellViewModel = item
    }
    func loadNext(item: NumberModel) {
        if numbers.isLastItem(item) {
            self.currentPage += 1
            getNumberList(page: currentPage, perPage: perPage) { [weak self] result in
                    self?.handleResult(result)
            }
        }
    }
    
    func onAppear() {
        getNumberList(page: currentPage, perPage: perPage) { [weak self] result in
                 self?.handleResult(result)
            }
    }
    
    private func getNumberList(page: Int, perPage: Int,
                                  completion: @escaping (Result<[NumberModel], Error>) -> Void) {

        let parameters: [String: Any] = [
                "page": currentPage,
                "per_page": perPage,
            ]
        
        print(itemCellViewModel)
        let realm = try! Realm()
        let itemModel = realm.object(ofType: ItemModel.self, forPrimaryKey: itemCellViewModel!.id)
        let results = itemModel?.numbers
        self.numbers = results!.compactMap({ (numberTable) -> NumberModel? in
            return numberTable
            
        })

    }
    
    private func handleResult(_ result: Result<[NumberModel], Error>) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.isLoading = false
            switch result {
            case .success(let items):
                self.currentPage += 1
//                self.numbers.append(contentsOf: items)
                print(self.numbers.count)
                self.numbers = items
            case .failure(let error):
                self.currentPage = 1
                print(error)
            }
        }
    }
    
    
}
