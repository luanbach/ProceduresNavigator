//
//  ProceduresListViewModelTests.swift
//  ProceduresNavigatorTests
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import ProceduresNavigator

class ProceduresListViewModelTests: XCTestCase {
    var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()

        disposeBag = DisposeBag()
    }

    func testInitialProcedureArrayIsSetInObservableValue() {
        let procedures: [Procedure] = [
            Procedure.init(identifier: "a", name: "b", icon: "c"),
            Procedure.init(identifier: "1", name: "2", icon: "3")
        ]
        let viewModel = ProceduresListViewModel(procedures: procedures)

        XCTAssertEqual(viewModel.procedures.value, procedures)
    }

    func testViewModelBindsDataProviderResponseToProcedures() {
        let mockDataProvider = MockDataProvider(data: jsonData(from: "procedures_list"))
        let viewModel = ProceduresListViewModel(dataProvider: mockDataProvider)

        let viewModelComplete = expectation(description: "View model fetch complete")
        viewModel
            .procedures
            .skip(1) //ignore the initial value
            .subscribe(onNext: { procedures in
                XCTAssertEqual(procedures.count, 10)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProcedures()

        waitForExpectations(timeout: 0.1)
    }

    func testViewModelConvertsFailedResponsesToEmptyArrayBeforeBinding() {
        let mockDataProvider = MockErrorDataProvider()
        let viewModel = ProceduresListViewModel(dataProvider: mockDataProvider)

        let viewModelComplete = expectation(description: "View model fetch complete")
        viewModel
            .procedures
            .skip(1) //ignore the initial value
            .subscribe(onNext: { procedures in
                XCTAssertTrue(procedures.isEmpty)
                viewModelComplete.fulfill()
            })
            .disposed(by: disposeBag)

        viewModel.fetchProcedures()

        waitForExpectations(timeout: 0.1)
    }
}
