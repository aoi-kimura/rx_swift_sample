//
//  SearchViewModelTests.swift
//  rx_swift_sampleTests
//
//  Created by 木村葵 on 2021/02/13.
//  Copyright © 2021 irohamiyamoto. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import RxBlocking
@testable import rx_swift_sample

class SearchViewModelTests: XCTestCase {
    
    var observable = BehaviorRelay<String>(value:"")

    var viewModel: SearchViewModelType {
        return SearchViewModel(withWordObservable: observable.asObservable())
    }
    
    override class func setUp() {
    }
    
    override class func tearDown() {
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_検索文字列入ったらAPIレスポンスが返ってくる() throws {
        observable.accept("Swift")
        XCTAssertNotEqual(try viewModel.outputs.items.toBlocking().first()?.count, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
