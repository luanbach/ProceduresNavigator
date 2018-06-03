//
//  URL+Creation.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import Foundation

extension URL {
    static var procedures: URL {
        guard let proceduresURL = URL(string: "https://staging.touchsurgery.com/tech-test/procedures") else {
            fatalError("Unable to create procedures URL from hard coded value")
        }

        return proceduresURL
    }
}
