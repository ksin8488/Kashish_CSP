//
//  InternetViewController.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class InternetMasterViewController : UITableViewController
{
    private (set) lazy var internetTopics : [String] =
    {
        return [    //Titles for Topics
            "Definitions",
            "CSP",
            "CTEC",
            "Canyons",
            "Twitter",
            "Swift Guide"
        ]
    }()
 
    private lazy var addresses : [String] = []
    
    private var detailViewController : InternetDetailViewController?
    
    private func setup() -> Void
    {
        //TODO: Replace with your correct links
        addresses = [   //apple wants secure sites hence the "https:" part
            "https://www.google.com",
            "https://www.google.com",
            "https://www.google.com",
            "https://www.google.com",
            "https://www.google.com",
            "https://www.google.com",
        ]
        
        if let splitView = splitViewController  //optional type
        {
            let currentControllers = splitView.viewControllers
            detailViewController = currentControllers[0] as?  //as? is cast beacuse we don't know if it has what we need from the 1st part of an array
                InternetDetailViewController
        }
    }
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        //Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false    //
    }
    
    // MARK: - table view data source (methods)
    
    override public func numberOfSections(in tableview: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return internetTopics.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) //reusing a ce
        let currentText = internetTopics[indexPath.row] //get the place value of the row that was clicked
        cell.textLabel!.text = currentText
        
        return cell
    }
    
    //MARK: Handle the internal transfer
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?)    //internal segue
    {
        if segue.identifier! == "showDetail"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let urlString = addresses[indexPath.row]
                let pageText : String
                
                if indexPath.row == 0
                {
                    //TODO: Replace with your definitions - great time to use the """ operator
                    pageText = """

                    All the definitions you wrote........

                    """ //""" text """ - makes everything between the quotes text

                }
                else
                {
                    pageText = internetTopics[indexPath.row]
                }
                
                let controller = segue.destination as!  //as! force casts the segue.destination into an InternetDetailViewController
                    InternetDetailViewController
                
                controller.detailAddress = urlString
                controller.detailText = pageText
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}
