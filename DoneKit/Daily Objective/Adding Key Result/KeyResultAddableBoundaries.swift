//
//  KeyResultAddableBoundaries.swift
//  DoneKit
//
//  Mobilette template version 4.1
//
//  Created by Romain Asnar on 3/4/17.
//   Copyright © 2017 Romain Asnar. All rights reserved.
//

public protocol KeyResultAddableInput: class
{
    func addKeyResult(request: KeyResultAddableDataModel.Add.Request)
}

public protocol KeyResultAddableOutput: class
{
    func refreshKeyResultList(response: KeyResultAddableDataModel.Add.Response)
    func showAlertPopup(error: Error)
}
