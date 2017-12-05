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
        drawStickFigure().stroke()
//        drawTurtle()
 //       drawHappyTree()
    }   //ONLY add code to this if you have code else the app will run very slowly due to trying to allocate memory for something that hasn't veen drawn.
    
        private func drawStickFigure(0) -> UIBezierPath
    {
        let stickFigure = UIBezierPath()
    
        UIColor.magenta.setStrong()
        stickFigure.lineWidth = 3.0 //Line width is by points and NOT pixles
    
        stickFigure.addArc(withCenter: CGPoint(x: 200, y: 200),
                           radius: CGFloat(20),
                           startAngle: CGFloat(0),
                           endAngle: CGFloat(2) * CGFloat.pi)
                           clockwise: true)
        stickFigure.move(to:CPoint(x: 200, y: 220)) //sets up the path to be traced when stroke is called
        stickFigure.addLine(to: CGPoint(x: 200, y: 270))
        stickFigure.move(to: CGPoint(x: 180, y: 240))
        stickFigure.addLine(to: CGPoint(x: 220, y: 240))
        stickFigure.move(to: CGPoint(x: 200, y: 270))
        stickFigure.addLine(to: CGPoint(x: 180, y: 300))
        stickFigure.move(to: CGPoint(x: 200 y: 270))
        stickFigure.addLine(to: CGPoint(x: 220, y: 300))
    
        return stickFigure
    }
}

