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
    
    var largePhotoIndexPath: IndexPath? //uses a closuers is a way to attach a method - Property with a method attached to it
    {
        didSet  //did i change something? if so change my values?
        {
            var indexPaths = [IndexPath]()  //no optional - guarentted to exist
            if let largePhotoIndexPath = largePhotoIndexPath    //if it's not nil... (only way it's not itself)
            {
                indexPaths.append(largePhotoIndexPath)
            }
            if let oldValue = oldValue
            {
                indexPaths.append(oldValue)
            }
            
            collectionView?.performBatchUpdates(    //load the stuff that is in the picture
                {
                    self.collectionView?.reloadItems(at: indexPaths)
                })
            {
                completed in
                
                if let largePhotoIndexPath = self.largePhotoIndexPath
                {
                    self.collectionView?.scrollToItem(at: largePhotoIndexPath,   at: .centeredVertically, animated: true)   //scroll to that part and centers it vertically then animates the movemnt so it can be seen
                }
            }
        }
   }
    
    //MARK: Lifecycle methods
    override public func viewDidLoad()  //ViewControllers have lifecycles
    {
        
    }
    
    //MARK:- UICollectionView methods
    
    override public func numberOfSections(in collectioVew: UICollectionView) -> Int
    {
        return 1
    }
    
    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int //_ means that it does not need to be named for a variable when called
    {
        return artSelection.count
    }
    
    override public func collectionView(_ collectionView: CollectionView, cellForItemAt indexPath: IndexPath : IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .purple
        artCell.imageView.image = artSelection[indexPath.row]
        artCell.imageName.text = "My Art"
        
        return artCell
    }
    
    //MARK:- Delegate methods
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath == largePhotoIndexPath
        {
            let art = artSelection[indexPath.row]
            let size = collectionView.bounds.size
            let widthScale = (size.width / art!.size.width) * CGFloat(0.80)
            let largeSize = CGSize(width: art!.size.width * widthScale, height: art!.size.height * widthScale)
            
            return largeSize
        }
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    public func cllectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }
    
    override public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
    {
        if largePhotoIndexPath == indexPath
        {
            largePhotoIndexPath = nil
        }
        else
        {
            largePhotoIndexPath = indexPath
        }
        
        return false
    }
    
    
    
    
    
    
    
    
    
}
