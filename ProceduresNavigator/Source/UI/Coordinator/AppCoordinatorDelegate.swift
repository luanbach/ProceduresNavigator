//
//  AppCoordinatorDelegate.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import UIKit

protocol AppCoordinatorDelegate: AnyObject {
    func procedureWasSelected(_ procedure: Procedure, fromViewController viewController: UIViewController)
}
