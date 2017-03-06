//
//  Database.swift
//  DoneKit
//
//  Created by Romain Asnar on 3/5/17.
//  Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation
import CoreData

public protocol Database
{
    func find(identifier: String) -> EntityDatabase?
    mutating func update(_ entity: EntityDatabase)
    mutating func add(_ entity: EntityDatabase)
    mutating func add(_ entities: [EntityDatabase])
    mutating func remove(identifier: String)
    mutating func removeAll()
    
    var all: [EntityDatabase] { get }
    var first: EntityDatabase? { get }
    var isEmpty: Bool { get }
}
