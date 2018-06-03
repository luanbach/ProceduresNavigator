//
//  AppCoordinator.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import UIKit

final class AppCoordinator {
    // MARK: - Private
    private let window: UIWindow

    // MARK: - Public
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds)) {
        self.window = window
        window.backgroundColor = .background
    }

    func start() {
        let proceduresListViewController = ProceduresListTableViewController(viewModel: ProceduresListViewModel(), coordinatorDelegate: self)
        let rootNavigationController = UINavigationController(rootViewController: proceduresListViewController)

        window.rootViewController = rootNavigationController

        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: AppCoordinatorDelegate {
    func procedureWasSelected(_ procedure: Procedure, fromViewController viewController: UIViewController) {
        let procedureDetailsViewController = ProcedureDetailsViewController(viewModel: ProcedureDetailsViewModel(procedure: procedure))
        viewController.navigationController?.pushViewController(procedureDetailsViewController, animated: true)
    }
}

