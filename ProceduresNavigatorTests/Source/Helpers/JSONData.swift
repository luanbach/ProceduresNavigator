//
//  JSONData.swift
//  ProceduresNavigatorTests
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import Foundation
import XCTest

//Dummy class used to get the test bundle
class JSONDataClass { }

func jsonData(from jsonName: String, file: StaticString = #file, line: UInt = #line) -> Data {
    guard let jsonPath = Bundle(for: JSONDataClass.self).path(forResource: jsonName, ofType: "json") else {
        XCTFail("Unable to find \(jsonName).json in test bundle", file: file, line: line)
        return Data()
    }

    guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
        XCTFail("Contents of \(jsonName).json is invalid data", file: file, line: line)
        return Data()
    }

    return data
}
