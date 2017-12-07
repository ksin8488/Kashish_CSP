//
//  CreativityViewController.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

// MARK: Shows a bolded pulldown menu comment
import UIKit
//MARK:- Class type should inherit from UICollectionViewController
public class CreativityViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout //Protocol and class to deal with
{
    private let reuseIdentifier = "artIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 0.0)
    private let itemPerRow : CGFloat = 3
    
    private lazy var artSelection : [UIImage?] =
    {
        return [
            UIImage(named: "cute"),
            UIImage(named: "squishBall"),
            UIImage(named: "tree"),
            UIImage(named: "squishBall"),
            UIImage(named: "squishBall"),
            UIImage(named: "squishBall"),
            UIImage(named: "squishBall"),
            UIImage(named: "squishBall"),
            UIImage(named: "squishBall"),
            UIImage(named: "squishBall")


        ]
    }()
    
    
    

}
