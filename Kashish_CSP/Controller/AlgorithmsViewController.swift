//
//  AlgorithmsViewController.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class AlgorithmsViewController : UIViewController
{
    // MARK: Data members
    @IBOutlet weak var algorithmText: UILabel!
    
    private func setupAlgorithm() -> Void
    {
        var algorithmSteps : [String] = []
        
        // MARK: - Algorithm definition
        let algorithm :String = "These are the instructions to create a project in Java using Ecliipse and Github \n "
        let stepOne :String = "Open up Eclipse and go to File “New Project” "
        let stepTwo :String = "Use the triangle to open the project then right-click on the SRC file and create a controller and model package "
        let stepThree :String = "Right click the controller package and create a controller and runner class "
        let stepFour : String = "Right click the model package and create a class with the project name "
        let stepFive :String = "Save changes by creating a new Github Repository "
        
        // TODO: Finish adding all the steps to the algorithm
        algorithmSteps = [stepOne, stepTwo, stepThree, stepFour, stepFive]
        
        let attributesDictionary = [NSAttributedStringKey.font : algorithmText.font]
        let fullAttributedString = NSMutableAttributedString(string: algorithm, attributes: attributesDictionary)
        
        for step in algorithmSteps
        {
            let bullet :String = "👾"
            let formattedStep :String = "\n\(bullet) \(step)"
            let attributedStringStep : NSMutableAttributedString = NSMutableAttributedString(string: formattedStep)
            let paragraphStyle = createParagraphStyle()
            
            attributedStringStep.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: NSMakeRange(0, attributedStringStep.length))
            
            fullAttributedString.append(attributedStringStep)
        }
        
        algorithmText.attributedText = fullAttributedString
    }
    
    private func createParagraphStyle() -> NSParagraphStyle
    {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.defaultTabInterval = 15
        paragraphStyle.firstLineHeadIndent = 20
        paragraphStyle.headIndent =  35
        
        return paragraphStyle
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setupAlgorithm()
    }
}
