//
//  KeyResultAddableSpec.swift
//  DoneKit
//
//  Created by Romain Asnar on 3/4/17.
//  Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

@testable import DoneKit
import Quick
import Nimble

let database = StaticDatabase.sharedInstance

final class AddingKeyResult: KeyResultAddable {
    weak var output: KeyResultAddableOutputMock? = nil
    var keyResults: [KeyResult] = []
    var keyResultRepository = KeyResultRepository(database: database)
}

class KeyResultAddableSpec: QuickSpec
{
    override func spec()
    {
        describe("a key result") {
            describe("is added") {
                var output: KeyResultAddableOutputMock!
                var interactor: AddingKeyResult!
                context("when all fields are valid") {
                    let request = KeyResultAddableDataModel.Add.Request(
                        title: "Catch them all!",
                        target: 151,
                        value: 1,
                        valueType: "pokemons"
                    )
                    beforeEach {
                        output = KeyResultAddableOutputMock()
                        interactor = AddingKeyResult()
                        interactor.output = output
                        interactor.addKeyResult(request: request)
                    }
                    it("should be created") {
                        expect(interactor.keyResultRepository.all.first {
                            $0.title == request.title
                            && $0.target == request.target
                            && $0.value == request.value
                            && $0.valueType == request.valueType
                        })
                            .toEventuallyNot(beNil())
                    }
                    it("the key result should be added to the connected user's key result list") {
                        expect(interactor.keyResultRepository.all.count).toEventually(equal(1))
                    }
                    it("should be stored into a persistant store") {
                        
                    }
                }
            }
        }
    }
}
