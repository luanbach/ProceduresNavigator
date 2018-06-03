//
//  ProcedureDetails.swift
//  ProceduresNavigator
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import Foundation

struct Phase: Decodable, Equatable {
    let name: String
    let icon: String
}

struct ProcedureDetails: Decodable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case card
        case phases
    }

    let identifier: String
    let name: String
    let card: String
    let phases: [Phase]
}

extension ProcedureDetails {
    init(emptyDetailFromProcedure procedure: Procedure) {
        self.init(identifier: procedure.identifier, name: procedure.name, card: "", phases: [])
    }
}
