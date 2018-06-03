//
//  ProceduresListTableViewController.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import RxSwift
import RxCocoa
import Kingfisher

class ProceduresListTableViewController: UIViewController {
    // MARK: - Private
    private let disposeBag = DisposeBag()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .background
        tableView.registerReusableElement(ProceduresTableViewCell.self)
        tableView.tableFooterView = UIView()
        return tableView
    }()

    private let viewModel: ProceduresListViewModel
    private weak var coordinatorDelegate: AppCoordinatorDelegate?

    // MARK: - UIViewController Setup
    @available(iOS, unavailable, message: "init() is unavailable, use init(viewModel:coordinatorDelegate:) instead")
    init() { fatalError() }

    @available(iOS, unavailable, message: "init() is unavailable, use init(viewModel:coordinatorDelegate:) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: ProceduresListViewModel, coordinatorDelegate: AppCoordinatorDelegate) {
        self.viewModel = viewModel
        self.coordinatorDelegate = coordinatorDelegate

        super.init(nibName: nil, bundle: nil)
        self.title = "Procedures"
    }

    override func loadView() {
        self.view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchProcedures()
    }

    private func setupBindings() {
        viewModel
            .procedures
            .bind(to: tableView.rx.items(cellIdentifier: ProceduresTableViewCell.reuseIdentifier)) { (_, procedure: Procedure, cell: ProceduresTableViewCell) in
                cell.nameLabel.text = procedure.name
                cell.iconImageView.kf.setImage(with: URL(string: procedure.icon))
            }
            .disposed(by: disposeBag)

        tableView.rx
            .modelSelected(Procedure.self)
            .subscribe(onNext: { [unowned self] selectedProcedure in
                self.coordinatorDelegate?.procedureWasSelected(selectedProcedure, fromViewController: self)
            })
            .disposed(by: disposeBag)
    }
}
