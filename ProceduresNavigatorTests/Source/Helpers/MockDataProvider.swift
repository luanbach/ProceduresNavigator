//
//  MockDataProvider.swift
//  ProceduresNavigatorTests
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import RxSwift
import RxCocoa
@testable import ProceduresNavigator

struct MockDataProvider: DataProvider {
    let data: Data

    func fetchResponse(from url: URL) -> Observable<Data> {
        return Observable.just(data)
    }
}
struct MockErrorDataProvider: DataProvider {
    let error: Error = NSError(domain: #file, code: #line, userInfo: nil)

    func fetchResponse(from url: URL) -> Observable<Data> {
        return Observable.error(error)
    }
}
