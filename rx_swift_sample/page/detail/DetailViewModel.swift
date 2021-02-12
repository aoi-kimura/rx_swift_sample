//
//  DetailViewModel.swift
//  rx_swift_sample
//
//  Created by 木村葵 on 2020/07/14.
//  Copyright © 2020 irohamiyamoto. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol DetailViewModelInputs {
    var webButtonTapped: Observable<URL> { get }
}

protocol DetailViewModelOutputs {
    var item: Driver<DetailItem> { get }
}

protocol DetailViewModelType {
    var inputs: DetailViewModelInputs { get }
    var outputs: DetailViewModelOutputs { get }
}

final class DetailViewModel: DetailViewModelType, DetailViewModelInputs, DetailViewModelOutputs {
    var inputs: DetailViewModelInputs { return self }
    var outputs: DetailViewModelOutputs { return self }
    
    var webButtonTapped: Observable<URL> {
        return item.map({ item in
            return (URL(string: item.url)!)
        }).asObservable()
    }
        
    var item: Driver<DetailItem>
    
    let disposeBag = DisposeBag()
    
    init(item: Item) {
        let factory = DetailItemFactory()
        self.item = Observable.just(item)
            .map({ item in
                return factory.make(item: item)
            })
            .asDriver(onErrorJustReturn: factory.makeDefault())
    }
}
