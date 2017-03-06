//
//  KeyResultRepositoryDataModel.swift
//  DoneKit
//
//  Created by Romain Asnar on 3/5/17.
//  Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

extension KeyResultRepository
{
    public struct Request {
        public var identifier: String
    }
    public struct Response {
        public var identifier: String
        public var title: String?
        public var target: Int
        public var value: Int
        public var valueType: String?
    }
}
