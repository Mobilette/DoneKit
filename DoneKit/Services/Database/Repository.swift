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

public protocol Repository
{
    // MARK: - Type
    
    associatedtype Request
    associatedtype Response
    associatedtype EntityType: EntityDatabase
    associatedtype DatabaseType: Database
    
    // MARK: - Property
    
    var database: DatabaseType { get set }
    
    // MARK: - CRUD
    
    func find(identifier: String) -> Response?
    mutating func update(_ entity: Request) throws
    mutating func add(_ entity: Request) throws
    mutating func add(_ entities: [Request]) throws
    mutating func remove(identifier: String)
    mutating func removeAll()
    
    var all: [Response] { get }
    var first: Response? { get }
    var isEmpty: Bool { get }
    
    // MARK: - Convert entity
    
    func convert(request: Request) throws -> EntityType
    func convert(entity: EntityType) throws -> Response
}

extension Repository
{
    public func find(identifier: String) -> Response?
    {
        guard let entity = database.find(identifier: identifier) as? EntityType else { return nil }
        return try? convert(entity: entity)
    }
    
    public mutating func update(_ entity: Request) throws
    {
        let entityDatabase = try convert(request: entity)
        database.update(entityDatabase)
    }
    
    public mutating func add(_ entity: Request) throws
    {
        let entityDatabase = try convert(request: entity)
        database.add(entityDatabase)
    }
    
    public mutating func add(_ entities: [Request]) throws
    {
        database.add(try entities.map {
            return try convert(request: $0)
        })
    }
    
    public mutating func remove(identifier: String)
    {
        database.remove(identifier: identifier)
    }
    
    public mutating func removeAll()
    {
        database.removeAll()
    }
    
    public var all: [Response] {
        guard let entities = database.all as? [EntityType] else { return [] }
        do { return try entities.map { try convert(entity: $0) } }
        catch { return [] }
    }
    
    public var first: Response? {
        guard let firstEntity = database.first as? EntityType else { return nil }
        return try? convert(entity: firstEntity)
    }
    
    public var isEmpty: Bool { return database.isEmpty }
}
