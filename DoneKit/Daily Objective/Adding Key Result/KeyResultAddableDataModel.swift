//
//  KeyResultAddableDataModel.swift
//  DoneKit
//
//  Mobilette template version 4.1
//
//  Created by Romain Asnar on 3/4/17.
//   Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

public struct KeyResultAddableDataModel {
    public struct Add { }
}

extension KeyResultAddableDataModel.Add
{
    public struct Request
    {
        var title: String?
        var target: Int
        var value: Int
        var valueType: String?
    }
    public struct Response
    {
        
    }
}
