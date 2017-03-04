//
//  Repository.swift
//  DoneKit
//
//  ACMS template version 3.1
//
//  Created by Romain Asnar on 3/4/17.
//   Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

protocol Repository
{
    associatedtype EntityType: Entity
    
    var entities: [EntityType] { get set }
    
    func find(identifier: String) -> EntityType?
    mutating func update(_ entity: EntityType)
    mutating func add(_ entity: EntityType)
    mutating func add(_ entities: [EntityType])
    mutating func remove(identifier: String)
    mutating func removeAll()
    
    var all: [EntityType] { get }
    var isEmpty: Bool { get }
}

extension Repository
{
    func find(identifier: String) -> EntityType?
    {
        return entities.first { $0.identifier == identifier }
    }
    
    mutating func update(_ entity: EntityType)
    {
        entities = entities.map {
            return ($0.identifier == entity.identifier) ? entity : $0
        }
    }
    
    mutating func add(_ entity: EntityType)
    {
        entities.append(entity)
    }
    
    mutating func add(_ entities: [EntityType])
    {
        self.entities.append(contentsOf: entities)
    }
    
    mutating func remove(identifier: String)
    {
        entities = entities.filter { $0.identifier != identifier }
    }
    
    mutating func removeAll()
    {
        entities = []
    }
    
    var all: [EntityType] { return entities }
    
    var isEmpty: Bool { return entities.isEmpty }
}
