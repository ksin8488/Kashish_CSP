//
//  StuffedAnimal.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 11/20/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class StuffedAnimal : Cuddleable
{
    
    private var stuffedAnimalColor : UIColor
    //MARK: Cuddleable data member
    public var cuddlyMaybe: Bool
    
    public init()
    {
        self.stuffedAnimalColor = UIColor()
        self.cuddlyMaybe = false
    }
    
    //MARK:- Cuddleable methods
    public func cuddly() -> Void
    {
        print("I am cuddly")
        cuddlyMaybe = true
    }
    
    public func isCuddly() -> Bool
    {
        if(cuddlyMaybe)
        {
            print("cuddly")
        }
        else
        {
            print("unworthy")
        }
        return cuddlyMaybe
    }
}
