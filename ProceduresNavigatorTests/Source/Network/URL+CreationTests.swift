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

    func testProceduresURLForValidIdentifier() {
        let procedureDetailURL = URL.procedureDetails(forID: "id")
        XCTAssertEqual(procedureDetailURL?.absoluteString, "https://staging.touchsurgery.com/tech-test/procedures/id")
    }

    func testIdentifierIsEscaped() {
        let procedureDetailURL = URL.procedureDetails(forID: "spaces are escaped")
        XCTAssertEqual(procedureDetailURL?.absoluteString, "https://staging.touchsurgery.com/tech-test/procedures/spaces%20are%20escaped")
    }
}
