//
//  ProcedureDetailsViewModelTests.swift
//  ProceduresNavigatorTests
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import ProceduresNavigator

class ProcedureDetailsViewModelTests: XCTestCase {
    var disposeBag: DisposeBag!
    var procedure: Procedure!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
        procedure = Procedure(identifier: "identifier", name: "name", icon: "icon")
    }

    func testProcedureIsObservableFromInitialValue() {
        let viewModel = ProcedureDetailsViewModel(procedure: procedure)

        XCTAssertEqual(viewModel.procedure.value, procedure)
    }

    func testDetailResponseIsBoundToObservable() {

        let mockDataProvider = MockDataProvider(data: jsonData(from: "procedure_details"))
        let viewModel = ProcedureDetailsViewModel(procedure: procedure, dataProvider: mockDataProvider)

        let viewModelComplete = expectation(description: "View model fetch complete")

        viewModel
            .procedureDetails
            .subscribe(onNext: { detail in
                XCTAssertEqual(detail.identifier, "procedure-TSC_AnkleORIF")
                XCTAssertEqual(detail.phases.count, 1)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProcedureDetails()

        waitForExpectations(timeout: 0.1)
    }

    func testEmptyDetailIsUsedWhenRequestFails() {

        let mockDataProvider = MockErrorDataProvider()
        let viewModel = ProcedureDetailsViewModel(procedure: procedure, dataProvider: mockDataProvider)

        let viewModelComplete = expectation(description: "View model fetch complete")

        viewModel
            .procedureDetails
            .subscribe(onNext: { detail in
                XCTAssertEqual(detail.identifier, self.procedure.identifier)
                XCTAssertTrue(detail.phases.isEmpty)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProcedureDetails()

        waitForExpectations(timeout: 0.1)
    }
}
