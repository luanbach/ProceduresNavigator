//
//  Procedure.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import Foundation

struct Procedure: Decodable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case icon
    }

    let identifier: String
    let name: String
    let icon: String
}
