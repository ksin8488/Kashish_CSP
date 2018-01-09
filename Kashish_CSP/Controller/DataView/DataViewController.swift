//
//  DataViewController.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class DataViewController : UITableViewController
{
    lazy var bucketList : [BucketItem] =
    {
            return loadBucketListFromFile()     //Loading a file
    }()
    
    private func loadBucketListFromFile() -> [BucketItem]
    {
        var items = [BucketItem]()
        if let filePath = Bundle.main.url(forResource: "bucket", withExtension: "csv")
        {
            do
            {
                let input = try String(contentsOf: filePath)
                let bucketLines = input.components(separatedBy: "\n")
                for line in bucketLines
                {
                    let item = line.components(separatedBy: ",")
                    items.append(BucketItem(contents: item[0],author: item[1]))
                }
            }
            catch
            {
                print("File load error")
            }
        }
        return items
    }
    
    //MARK: TableView code
    
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection sectioin: Int) -> Int
    {
        return bucketList.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "dataIdentifier", for: indexPath) as! BucketItemCell
        
        currentCell.bucketItem = bucketList[indexPath.row]
        //          currentCell.bucketItemsSignature.text = currentCell.bucketItem.itemAuthor
        
        return currentCell
    }
    
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
