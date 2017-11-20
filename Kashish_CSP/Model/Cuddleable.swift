//
//  Cuddleable.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 11/20/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public protocol Cuddleable
{
    var cuddlyMaybe : Bool {get set}
    func cuddly() -> Void
    func isCuddly() -> Bool
}
