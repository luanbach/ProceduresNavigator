//
//  DataProvider.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import RxSwift
import RxCocoa

// This is an abstraction around URLSession which will help testing view models
protocol DataProvider {
    func fetchResponse(from url: URL) -> Observable<Data>
}

extension URLSession: DataProvider {
    func fetchResponse(from url: URL) -> Observable<Data> {
        let urlRequest = URLRequest(url: url)

        return self.rx.data(request: urlRequest)
    }
}
