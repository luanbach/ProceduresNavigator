//
//  URL+CreationTests.swift
//  ProceduresNavigatorTests
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import XCTest
@testable import ProceduresNavigator

class URL_CreationTests: XCTestCase {
    func testProceduresURLValue() {
        let proceduresURL = URL.procedures
        XCTAssertEqual(proceduresURL.absoluteString, "https://staging.touchsurgery.com/tech-test/procedures")
    }
}
