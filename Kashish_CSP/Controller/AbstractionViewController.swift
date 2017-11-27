//
//  AbstractionViewController.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class AbstractionViewController : UIPageViewController, UIPageViewControllerDataSource
{
    //MARK: Array of subviews
    private (set) lazy var orderedAbstractionViews : [UIViewController] =
    {
        return [
            self.newAbstractionViewController(abstractionLevel: "Block"),
            self.newAbstractionViewController(abstractionLevel: "JavaCode"),
            self.newAbstractionViewController(abstractionLevel: "ByteCode"),
            self.newAbstractionViewController(abstractionLevel: "Binary"),
            self.newAbstractionViewController(abstractionLevel: "AndGate")
        ]
    }()
    
    //Helper method to retrieve the correct ViewController
    private func newAbstractionViewController(abstractionLevel : String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)ViewController")
    }
    
    public override func viewDidLoad()  //you can also do "overide public func viewDidLoad()" as long as "public" and "override" are the first two
    {
        super.viewDidLoad() //superclass called first
        dataSource = self   //dataSource is a subtype and says it is its own UI
        
        if let firstViewController = orderedAbstractionViews.first  //"arrayName.first" gets the first thing in the array
        {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    //MARK:- Required Protocol methods for UIPageViewControllerDatasource
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        // Left Swiping Method - grabs current thing from the array and subtracts 1 and calls it "previous Index". if it is less than 0 then it is set as the last one. Also guards If the total views are somehow greater than the previous index to prevent crashing
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
        else
        {
        return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex > 0
        else
        {
            return orderedAbstractionViews.last
        }
        
        guard orderedAbstractionViews.count > previousIndex
        else
        {
            return nil
        }
        
        return orderedAbstractionViews[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
        else
        {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex >= 0
        else
        {
            return nil
        }
        
        guard nextIndex < orderedAbstractionViews.count
        else
        {
           return orderedAbstractionViews.first
        }
        
        return orderedAbstractionViews[nextIndex]
    }

    //MARK:- Support for dots in the UIPageViewController
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int
    {
        return orderedAbstractionViews.count
    }

    public func presentationIndex(for pageViewController: UIPageViewController) -> Int
    {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedAbstractionViews.index(of: firstViewController)
        else
        {
            return 0
        }
        
        return firstViewControllerIndex
    }
}

