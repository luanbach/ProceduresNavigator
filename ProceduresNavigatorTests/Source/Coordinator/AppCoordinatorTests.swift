//
//  AppCoordinatorTests.swift
//  ProceduresNavigatorTests
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import XCTest
@testable import ProceduresNavigator

class AppCoordinatorTests: XCTestCase {
    func testWindowIsMadeKeyOnStart() {
        let window = UIWindow()
        XCTAssertFalse(window.isKeyWindow)

        let appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()

        XCTAssertTrue(window.isKeyWindow)
    }
}
