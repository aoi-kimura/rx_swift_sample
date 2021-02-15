//
//  DetailItemFactoryTests.swift
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

class DetailItemFactoryTests: XCTestCase {
    
    let factory = DetailItemFactory()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_100文字以内の本文がそのまま表示されているか() throws {
        let mock = ItemTestMock.shortBody
        let item = factory.make(item: mock)
        XCTAssertEqual(item.body, mock.body)
    }
    
    func test_100文字以上の本文が三点リーダ省略されてるか() throws {
        let mock = ItemTestMock.longBody
        let item = factory.make(item: mock)
        XCTAssertNotEqual(item.body, mock.body)
        XCTAssertTrue(item.body.hasSuffix("..."))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
