//
//  DetailViewController.swift
//  rx_swift_sample
//
//  Created by 木村葵 on 2020/07/14.
//  Copyright © 2020 irohamiyamoto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SafariServices

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var webButton: UIButton! {
        didSet {
            webButton
                .rx
                .tap.subscribe(onNext: {[weak self] in
                    self?.onWebButtonTapped()
                }).disposed(by: disposeBag)
        }
    }
    
    var viewModel: DetailViewModelType!
    let disposeBag = DisposeBag()
    
    static func make(with viewModel: DetailViewModel) -> UIViewController {
        let view = R.storyboard.detail().instantiateInitialViewController() as? DetailViewController
        view?.viewModel = viewModel
        return view ?? DetailViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel
            .outputs
            .item
            .drive(onNext: { item in
                self.titleLabel.text = item.title
                self.createdDateLabel.text = item.createdAt
                self.mainLabel.text = item.body
            })
        .disposed(by: disposeBag)
    }
    
    private func onWebButtonTapped() {
        self.viewModel
            .inputs
            .webButtonTapped
            .subscribe(onNext: { url in
                let safariViewController = SFSafariViewController(url: url)
                safariViewController.modalPresentationStyle = .overFullScreen
                self.present(safariViewController, animated: true, completion: nil)
            })
            .disposed(by: self.disposeBag)
    }

}
