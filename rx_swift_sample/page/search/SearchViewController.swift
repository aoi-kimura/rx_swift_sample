//
//  ViewController.swift
//  rx_swift_sample
//
//  Created by 木村葵 on 2020/07/09.
//  Copyright © 2020 irohamiyamoto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/**
 検索画面
 */
class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rx.modelSelected(Item.self)
                .subscribe(onNext: { item in
                    let vc = DetailViewController.make(with: DetailViewModel(item: item))
                    self.navigationController?.pushViewController(vc, animated: true)
                })
                .disposed(by: disposeBag)
        }
    }
    
    var searchViewModel: SearchViewModelType!
    
    let disposeBag = DisposeBag()
    
    /**
     0.5秒間隔で検索ワードを監視
     */
    var searchBarText: Observable<String> {
        return searchBar.rx.text
            .filter { $0 != nil }
            .map { $0! }
            .filter { $0.count > 0 }
            .debounce(DispatchTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchViewModel = SearchViewModel(withWordObservable: searchBarText)
        
        searchViewModel
            .outputs
            .items
            .drive(tableView.rx.items) { (_, _, item) in
                let cell = UITableViewCell()
                cell.textLabel?.text = item.title
            return cell
        }
        .disposed(by: disposeBag)
    }

}
