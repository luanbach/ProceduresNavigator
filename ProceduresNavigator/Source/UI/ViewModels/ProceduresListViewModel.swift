//
//  ProceduresListViewModel.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import RxSwift
import RxCocoa

final class ProceduresListViewModel {
    // MARK: - Output
    let procedures: BehaviorRelay<[Procedure]>

    // MARK: - Private
    private let disposeBag = DisposeBag()
    private let dataProvider: DataProvider

    // MARK: - Public
    init(procedures: [Procedure] = [], dataProvider: DataProvider = URLSession.shared) {
        self.procedures = BehaviorRelay(value: procedures)
        self.dataProvider = dataProvider
    }

    func fetchProcedures() {
        dataProvider
            .fetchResponse(from: .procedures)
            .convert(to: [Procedure].self)
            .catchErrorJustReturn([]) // TODO: Add more errors handling. Just return an empty list for now.
            .observeOn(MainScheduler.instance) // Has to run on UI Thread as its where the table gets updated.
            .bind(to: procedures)
            .disposed(by: disposeBag)
    }
}
