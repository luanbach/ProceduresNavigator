//
//  ProcedureDetailsViewModel.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import RxSwift
import RxCocoa

final class ProcedureDetailsViewModel {
    // MARK: - Output
    let procedure: BehaviorRelay<Procedure>
    let procedureDetails: PublishSubject<ProcedureDetails> = PublishSubject()

    // MARK: - Private
    private let disposeBag = DisposeBag()
    private let dataProvider: DataProvider

    // MARK: - Public
    init(procedure: Procedure, dataProvider: DataProvider = URLSession.shared) {
        self.procedure = BehaviorRelay(value: procedure)
        self.dataProvider = dataProvider
    }

    func fetchProcedureDetails() {
        guard let url = URL.procedureDetails(forID: procedure.value.identifier) else {
            print("Invalid URL")
            return
        }

        // Create empty detail here to avoid implicitly capturing self
        let emptyProcedureDetail = ProcedureDetails(emptyDetailFromProcedure: procedure.value)

        dataProvider
            .fetchResponse(from: url)
            .convert(to: ProcedureDetails.self)
            .catchErrorJustReturn(emptyProcedureDetail) // TODO: Error handling. Just the name for now.
            .observeOn(MainScheduler.instance) // Run on Main thread for UI
            .bind(to: procedureDetails)
            .disposed(by: disposeBag)
    }
}
