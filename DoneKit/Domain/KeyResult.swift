//
//  KeyResult.swift
//  DoneKit
//
//  Created by Romain Asnar on 3/4/17.
//  Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

public struct KeyResult: Entity
{
    public var identifier: String
    public var title: String
    public var target: Int
    public var value: Int
    public var valueType: String
    
    public init(entity: KeyResult) {
        self.identifier = entity.identifier
        self.title = entity.title
        self.target = entity.target
        self.value = entity.value
        self.valueType = entity.valueType
    }
}
