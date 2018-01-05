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
            "https://apstudent.collegeboard.org/apcourse/ap-computer-science-principles",
            "https://ctec.canyonsdistrict.org/",
            "http://www.canyonsdistrict.org/",
            "https://twitter.com/",
            "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html",
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

                    TERMS
                    URL (Uniform Resource Locator) - The address for a world wide web (www) page
                    TCP (Transmission Control Protocol) - set of rules that governs the transmission of data over
                    the internet or other networks
                    IP (Internet Protocol) - method or protocol from which data is sent from one computer to another
                    DNS (Domain Name System) - internet’s system from converting alphabetic names into numeric IP address
                    What the internet means to me and the world
                    The internet is a place that contains nearly everything. And to me, that means that it is a place where I can find and do anything (that is morally correct). If I want to communicate important information with others, just chat with friends, view funny videos, etc. I can do all that and much much more. And to the world, internet has changed everything. A message between nations can occur in seconds and knowledge is available to anyone that has a connection to the internet. Faraway places are now only a button click away and everyone is connected together by streams of data. And that has completely changed how people in today’s day and age live. It is a vital part of our societies both individually and nationally.


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
