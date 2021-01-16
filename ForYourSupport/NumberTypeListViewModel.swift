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
    @Published var items: [NumberDB] = []
    @Published var isLoading = false
    var numberTables: Results<NumberDB>!
    
    private var cancellables: Set<AnyCancellable> = []

    private let perPage = 20
    private var currentPage = 1
    
    func loadNext(item: NumberDB) {
        if items.isLastItem(item) {
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
                                  completion: @escaping (Result<[NumberDB], Error>) -> Void) {

        let parameters: [String: Any] = [
                "page": currentPage,
                "per_page": perPage,
            ]
        
        
        let realm = try! Realm()
        let results = realm.objects(NumberDB.self)
        self.items = results.compactMap({ (numberTable) -> NumberDB? in
            return numberTable
            
        })

    }
    
    private func handleResult(_ result: Result<[NumberDB], Error>) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.isLoading = false
            switch result {
            case .success(let items):
                self.currentPage += 1
                self.items.append(contentsOf: items)
            case .failure(let error):
                self.currentPage = 1
                print(error)
            }
        }
    }
}
