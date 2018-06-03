//
//  ProcedureDetailsViewController.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import RxSwift
import RxCocoa

class ProcedureDetailsViewController: UIViewController {
    // MARK: - Private
    private let viewModel: ProcedureDetailsViewModel
    private let detailView: ProcedureDetailsView = ProcedureDetailsView()
    private let disposeBag = DisposeBag()

    // MARK: - UIViewController Setup
    @available(iOS, unavailable, message: "init() is unavailable, use init(viewModel:) instead")
    init() { fatalError() }

    @available(iOS, unavailable, message: "init() is unavailable, use init(viewModel:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: ProcedureDetailsViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.fetchProcedureDetails()
    }

    private func setupBindings() {
        // Setup table from Phases
        viewModel
            .procedureDetails
            .mapToKeypath(\.phases)
            .bind(to: detailView.tableView.rx.items(cellIdentifier: ProceduresTableViewCell.reuseIdentifier)) { (_, phase: Phase, cell: ProceduresTableViewCell) in
                cell.nameLabel.text = phase.name
                cell.iconImageView.kf.setImage(with: URL(string: phase.icon))
            }
            .disposed(by: disposeBag)

        // Setup bindings for both detail and procedure to get an immediate title
        viewModel
            .procedure
            .observeOn(MainScheduler.instance)
            .mapToKeypath(\.name)
            .bind(to: detailView.titleLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel
            .procedureDetails
            .mapToKeypath(\.name)
            .bind(to: detailView.titleLabel.rx.text)
            .disposed(by: disposeBag)

        // Load image from card once detail is loaded
        viewModel
            .procedureDetails
            .mapToKeypath(\.card)
            .subscribe(onNext: { [unowned self] card in
                self.detailView.imageView.kf.setImage(with: URL(string: card))
            })
            .disposed(by: disposeBag)

        // Set title to name of procedure
        viewModel
            .procedure
            .observeOn(MainScheduler.instance)
            .mapToKeypath(\.name)
            .bind(to: self.navigationItem.rx.title)
            .disposed(by: disposeBag)
    }
}
