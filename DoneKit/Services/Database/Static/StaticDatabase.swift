//
//  StaticDatabase.swift
//  DoneKit
//
//  Created by Romain Asnar on 3/5/17.
//  Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

public struct StaticDatabase: Database
{
    public static let sharedInstance = StaticDatabase()
    private init() { }
    
    var entities: [EntityDatabase] = []
    
    public func find(identifier: String) -> EntityDatabase?
    {
        return entities.first { $0.identifier == identifier }
    }
    
    public mutating func update(_ entity: EntityDatabase)
    {
        entities = entities.map {
            return ($0.identifier == entity.identifier) ? entity : $0
        }
    }
    
    public mutating func add(_ entity: EntityDatabase)
    {
        entities.append(entity)
    }
    
    public mutating func add(_ entities: [EntityDatabase])
    {
        self.entities.append(contentsOf: entities)
    }
    
    public mutating func remove(identifier: String)
    {
        entities = entities.filter { $0.identifier != identifier }
    }
    
    public mutating func removeAll()
    {
        entities = []
    }
    
    public var all: [EntityDatabase] { return entities }
    
    public var first: EntityDatabase? { return entities.first }
    
    public var isEmpty: Bool { return entities.isEmpty }
}
