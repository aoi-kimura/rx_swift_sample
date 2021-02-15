//
//  DetailItemTestMock.swift
//  rx_swift_sampleTests
//
//  Created by 木村葵 on 2021/02/13.
//  Copyright © 2021 irohamiyamoto. All rights reserved.
//

import Foundation

struct ItemTestMock {
    
    static let shortBody = Item(
        body: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。",
        createdAt: "2021-02-12T23:43:43+09:00",
        title: "タイトル",
        url: "https://www.youtube.com/"
    )
    
    static let longBody = Item(
        body: "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。",
        createdAt: "2021-02-12T23:43:43+09:00",
        title: "タイトル",
        url: "https://www.youtube.com/"
    )
}
