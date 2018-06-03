//
//  Observable+Decoding.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import RxSwift

extension Observable where Element == Data {
    // Helper to convert to any Decodable type from a data Observable (e.g. network response)
    func convert<T: Decodable>(to convertType: T.Type, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> Observable<T> {
        return self.map { data in
            try decoder.decode(convertType, from: data)
        }
    }
}

extension Observable {
    // Helper to map to a specific keypath, rather than mapping and operating on data
    func mapToKeypath<Value>(_ keyPath: KeyPath<Element, Value>) -> Observable<Value> {
        return self.map { $0[keyPath: keyPath] }
    }
}
