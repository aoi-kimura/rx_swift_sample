# rx_swift_sample

Qiitaの記事検索アプリをRxSwift, MVVMで実装しています。

## 主な機能、UIコンポーネント

ライブラリは一律CocoaPods管理
* API通信
* UISerchbar
* TableView表示
* 画面遷移(push, present)
* SFSafariViewController表示

## 使用してるライブラリ

* RxSwift
* RxAlamofire
* R.swift
* SwiftLint

## ビルド方法

ルートディレクトリで以下コマンド実装

```
pod install
```

rx_swift_sample.xcworkspaceを開いてXcodeでビルド

## 参考にした記事🙇‍♂️

RxSwift  
https://egg-is-world.com/2018/08/11/rxswift-behaviorrelay-publishrelay/  
https://medium.com/@calvinw/using-uitableview-in-swift-2-with-rxswift-3e6dac456b92  
MVVM  
https://qiita.com/fumiyasac@github/items/da762ea512484a8291a3  
codable  
https://qiita.com/s_emoto/items/deda5abcb0adc2217e86  