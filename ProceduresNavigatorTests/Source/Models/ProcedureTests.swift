//
//  ProcedureTests.swift
//  ProceduresNavigatorTests
//
//  Created by Luan Bach on 03/06/2018.
//  Copyright © 2018 Little Blue Dot. All rights reserved.
//

import XCTest
@testable import ProceduresNavigator

class ProcedureTests: XCTestCase {
    func testMappingFromJSON() {
        do {
            let detail = try JSONDecoder().decode(ProcedureDetails.self, from: jsonData(from: "procedure_details"))

            XCTAssertEqual(detail.identifier, "procedure-TSC_AnkleORIF")
            XCTAssertEqual(detail.card, "https://content.touchsurgery.com/aa/42/aa4265e3d9ac17ec2bbf972477f757d85179e76120b4156155658339ffe211c0?Expires=1523711048&Signature=Y-AtrWfrXehemA8Xs56vPo4ge1LgM5zE5yl5s1VXnu0xgINfqh33gAK3Os386ZQCh1ofXSubYVKizJ8GAdRRkwE5LAHZ~GLAy46x3wNYc6Z-~X~hFwSr7AEIHPDPXozf-gME8elJ44Q7oW3NGdIQ9v5SKgxRRBgREANUV1hkYop5zhDNRDES-2q6xQ1LDmcCIpMlFieh~7lu81rqVXfXTO~60Zp91Z3kjhoEX72dkpZRrR~FB0eTgSr1uTcbi7BM7wIn2YbpOvnZD0tsL18Waejb6i-o1jxoZ7ywiSZb9gU1PzBmR1vfdGk5appizX8dIrSbQ4kulwhaY7ZshI3X1w__&Key-Pair-Id=APKAISEZV3CS3QKJL3CQ")
            XCTAssertEqual(detail.name, "Ankle ORIF")

            let phases = detail.phases
            XCTAssertEqual(phases.count, 1)

            if let first = phases.first {
                XCTAssertEqual(first.name, "Ankle ORIF")
                XCTAssertEqual(first.icon, "https://content.touchsurgery.com/41/0c/410c97d58c6a95983c4992f2713c19acf5198aa6a76a05dd2602796d59f6f327?Expires=1523711048&Signature=YjfRBUCEVQYkV4IZxv0fxRoKzF-LMpvrDjw9TWaSQNssL94Kv9I8EfxTI8vz9vCXQgd6XODC0A6qWZ3Uml9UWNu~RZ~mIEfIlxJkzInCH2vh0W-yHufvHRz6FinBkkpp5xu5ObcL47vwRfiokIWFKnLoKj1f0Bd7tKjt5N30f~iXv1iItiKqiHrCe2kW9-2CPbpYh4I-oFdAxlCFm7HNReahFIHljvKbApiNcCMi4Q-AMsXB~pnaBlchX68jCHjh-FUDNkcyjpgGz1YGxbWBRzJtqYeP4idGXqYa-H7P~loo~0YQNkT1ezgz4OTgkEUaPnIfqzuLj0ayibBKWheF7Q__&Key-Pair-Id=APKAISEZV3CS3QKJL3CQ")
            }
        } catch {
            XCTFail("Unexpected decoding error: \(error)")
        }
    }

    func testCreatingEmptyVersionFromProcedure() {

        let procedure = Procedure(identifier: "identifier", name: "name", icon: "icon")
        let detail = ProcedureDetails(emptyDetailFromProcedure: procedure)

        XCTAssertEqual(detail.identifier, procedure.identifier)
        XCTAssertEqual(detail.name, procedure.name)
        XCTAssertTrue(detail.card.isEmpty)
        XCTAssertTrue(detail.phases.isEmpty)
    }
}
