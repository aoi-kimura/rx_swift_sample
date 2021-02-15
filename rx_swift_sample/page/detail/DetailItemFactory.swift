//
//  DetailItemFactory.swift
//  rx_swift_sample
//
//  Created by 木村葵 on 2020/07/20.
//  Copyright © 2020 irohamiyamoto. All rights reserved.
//

import Foundation

final class DetailItemFactory {
    
    let maxBodyCount = 100
    
    func make(item: Item) -> DetailItem {
        return DetailItem(title: item.title,
                          createdAt: makeCreatedAt(createdAt: item.createdAt),
                          body: makeBody(body: item.body),
                          url: item.url)
    }
    
    /**
     fixme: dateformat使う
     */
    private func makeCreatedAt(createdAt: String) -> String {
        return String(createdAt.prefix(10))
    }
    
    /**
     bodyに文字数制限つけて...を後ろにつける整形をする
     */
    private func makeBody(body: String) -> String {
        guard body.count >= maxBodyCount else {
            return body
        }
        var formattedBody = String(body.prefix(maxBodyCount))
        formattedBody.append("...")
        return formattedBody
    }
    
    func makeDefault() -> DetailItem {
        return DetailItem(title: "", createdAt: "", body: "", url: "")
    }
}
