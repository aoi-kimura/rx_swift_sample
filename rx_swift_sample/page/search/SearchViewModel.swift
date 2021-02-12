//
//  SearchViewModel.swift
//  rx_swift_sample
//
//  Created by 木村葵 on 2020/07/12.
//  Copyright © 2020 irohamiyamoto. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

protocol SearchViewModelInputs {
}

protocol SearchViewModelOutputs {
    var items: Driver<[Item]> { get }
}

protocol SearchViewModelType {
    var inputs: SearchViewModelInputs { get }
    var outputs: SearchViewModelOutputs { get }
}

final class SearchViewModel: SearchViewModelType, SearchViewModelInputs, SearchViewModelOutputs {
    
    var inputs: SearchViewModelInputs { return self }
    var outputs: SearchViewModelOutputs { return self }
    
    private let decoder = JSONDecoder()
    
    lazy var items: Driver<[Item]> = self.fetchItems()

    fileprivate var searchWord: Observable<String>

    init(withWordObservable wordObservable: Observable<String>) {
        self.searchWord = wordObservable
    }
    
    /**
     API実行、jsonをパースしてdriver型で返す
     */
    private func fetchItems() -> Driver<[Item]> {
        return searchWord
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMapLatest { text in
                return RxAlamofire
                    .requestData(.get, "https://qiita.com/api/v2/items?page=1&per_page=20&query=\(text)")
                    .debug()
                    .catchError { _ in
                        return Observable.never()
                }
        }
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .map { (_, json) -> [Item] in
                let data = try? self.decoder.decode([Item].self, from: json)
                return data ?? []
        }
            .asDriver(onErrorJustReturn: [])
    }

}
