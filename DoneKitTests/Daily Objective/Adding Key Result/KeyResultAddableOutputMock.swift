//
//  KeyResultAddableOutputMock.swift
//  DoneKit
//
//  Created by Romain Asnar on 3/4/17.
//  Copyright © 2017 Romain Asnar. All rights reserved.
//

import Foundation

class KeyResultAddableOutputMock: KeyResultAddableOutput
{
    var didRefreshKeyResultList = false
    var didShowAlertPopup = false
    
    func refreshKeyResultList(response: KeyResultAddableDataModel.Add.Response)
    {
        didRefreshKeyResultList = true
    }
    
    func showAlertPopup(error: Error)
    {
        didShowAlertPopup = true
    }
}
