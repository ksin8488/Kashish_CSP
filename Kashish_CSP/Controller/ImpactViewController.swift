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
    
    private func addImages() -> Void
    {
        appLayout.image = UIImage(named: "GlobalImpactAppLayout")
    }
    
    private func addText() -> Void
    {
        reasonExplination.text = "It is importaint to make sure people who need clean water get it."
        personalConnection.text = "I have family in India and I know I would want them to have clean water."
    }
    
    public override func viewDidLoad()
    {
        addImages()
        addText()
        super.viewDidLoad()
    }
}
