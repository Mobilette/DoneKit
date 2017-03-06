//
//  KeyResultRepository.swift
//  DoneKit
//
//  Created by Romain Asnar on 3/4/17.
//  Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

public class KeyResultRepository: Repository
{
    // MARK: - Property
    
    public var database: StaticDatabase
    
    // MARK: - Life cycle
    
    public init(database: StaticDatabase)
    {
        self.database = database
    }
    
    // MARK: - Convert entities
    
    public func convert(request: Request) throws -> StaticDatabase.KeyResult
    {
        return StaticDatabase.KeyResult(identifier: request.identifier)
    }
    
    public func convert(entity: StaticDatabase.KeyResult) throws -> Response
    {
        return Response(
            identifier: "",
            title: "",
            target: 0,
            value: 0,
            valueType: ""
        )
    }
}
