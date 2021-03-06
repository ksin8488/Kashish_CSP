//
//  drawingView.swift
//  Kashish_CSP
//
//  Created by Singh, Kashish on 12/5/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawStickFigure().stroke()  //until you call stroke or fill, the lines will be there but clear
        drawTurtle()
        drawHappyTree()
    }   //ONLY add code to this if you have code else the app will run very slowly due to trying to allocate memory for something that hasn't veen drawn.
    
        private func drawStickFigure() -> UIBezierPath
    {
        let stickFigure = UIBezierPath()
    
        UIColor.cyan.setStroke()  //Sets color of the drawing
        stickFigure.lineWidth = 3.0 //Line width is by points and NOT pixles
    
        stickFigure.addArc(withCenter: CGPoint(x: 200, y: 200), //addArc is used for circles - Unit Circles
                           radius: CGFloat(20),
                           startAngle: CGFloat(0),
                           endAngle: CGFloat(2) * CGFloat.pi,
                           clockwise: true)
        stickFigure.move(to:CGPoint(x: 200, y: 220)) //sets up the path to be traced when stroke is called
        stickFigure.addLine(to: CGPoint(x: 200, y: 270))
        stickFigure.move(to: CGPoint(x: 180, y: 240))
        stickFigure.addLine(to: CGPoint(x: 220, y: 240))
        stickFigure.move(to: CGPoint(x: 200, y: 270))
        stickFigure.addLine(to: CGPoint(x: 180, y: 300))
        stickFigure.move(to: CGPoint(x: 200, y: 270))
        stickFigure.addLine(to: CGPoint(x: 220, y: 300))
    
        return stickFigure
    }
    
    public func drawHappyTree() -> Void
    {
        let mario = UIBezierPath()
        
        mario.move(to: CGPoint(x: 80, y: 50))
        mario.addLine(to: CGPoint(x: 120, y: 150))
        mario.addLine(to: CGPoint(x: 40, y: 150))
        mario.close()
        UIColor(patternImage: UIImage(named: "cute_Mario-2")!).setFill()
        UIColor.brown.setStroke()
        mario.lineWidth = 2.0
        mario.fill()
        mario.stroke()
        
        let happyTree = UIBezierPath()
        
        UIColor.green.setFill()
        happyTree.move(to: CGPoint(x: 110, y: 150))
        happyTree.addLine(to: CGPoint(x: 150, y: 200))
        happyTree.addLine(to: CGPoint(x: 10, y:200))
        happyTree.addLine(to: CGPoint(x:50 , y:150 ))
        happyTree.close()
        happyTree.stroke()
        happyTree.fill()
        happyTree.move(to: CGPoint(x: 80, y: 200))
        happyTree.addLine(to: CGPoint(x:80, y:250))
        happyTree.lineWidth = 6.0
        happyTree.stroke()
    }
    
    public func drawTurtle() -> Void
    {
        let logo = UIBezierPath()
        UIColor.white.setFill() //fills the image in white
        logo.move(to: CGPoint(x: 50, y: 250))
        logo.addLine(to: CGPoint(x: 100, y: 300))
        logo.addLine(to:CGPoint(x: 50, y: 350))
        logo.close()    //draws a line to the starting point as directly as it can
        logo.fill()     //fills the image/shape
    }
}

