//
//  KeyResultAddable.swift
//  DoneKit
//
//  Mobilette template version 4.1
//
//  Created by Romain Asnar on 3/4/17.
//   Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

public protocol KeyResultAddable: KeyResultAddableInput
{
    // MARK: - Type
    
    typealias DataModel = KeyResultAddableDataModel
    typealias Error = KeyResultAddableError
    associatedtype Output: KeyResultAddableOutput
    associatedtype KeyResultRepositoryType: Repository
    
    // MARK: - Property
    
    weak var output: Output? { get set }
    var keyResults: [KeyResult] { get set }
    var keyResultRepository: KeyResultRepositoryType { get set }
}

extension KeyResultAddable
{
    func addKeyResult(request: DataModel.Add.Request)
    {
        // FIXME: Incomplete implementation, application business rules should be implemented
    }
    
    fileprivate func validate(request: DataModel.Add.Request) -> Error?
    {
        // FIXME: Incomplete implementation, validation rules should be implemented
        return nil
    }
}
