//
//  ImpactViewController.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class ImpactViewController : UIViewController
{
    @IBOutlet weak var appDataPlan: UILabel!
    @IBOutlet weak var reasonExplination: UILabel!
    @IBOutlet weak var personalConnection: UILabel!

    @IBOutlet weak var appLayout: UIImageView!
    
    public override func viewDidLoad()
    {
        appLayout.image = UIImage(named: "GlobalImpactAppLayout")
        reasonExplination.text = "It is importaint to make sure people who need clean water get it."
        personalConnection.text = "I have family in India and I know I would want them to have clean water."
        super.viewDidLoad()
    }
}
