//
//  drawLineView.swift
//  allPrototype
//
//  Created by Dylan Shane on 7/30/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class drawLineView: UIView {
    var topOp = CGPoint.zero
    var secOp = CGPoint.zero
    var thirdOp = CGPoint.zero
    var fourOp = CGPoint.zero
    var fiveOp = CGPoint.zero
    var sixOp = CGPoint.zero
    
    var exMidTop = CGPoint.zero
    var exMidBot = CGPoint.zero
    var exForceOne = CGPoint.zero
    var exForceTwo = CGPoint.zero
    
    var chosenOp = CGPoint.zero
    var forcedCom = CGPoint.zero
    
    var robot = CGPoint.zero
    var ghost = CGPoint.zero
    
    var combThreeCoord: [CGPoint] = []
    
    var currentColor = UIColor.clear
    
    var buttonOrigin = CGPoint.zero
    //var secondOrigin = CGPoint.zero
    
    //var secondButtonPressed = false
    
    var whichView = 1
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(currentColor.cgColor)
        
        if (whichView == 1){
            context?.move(to: buttonOrigin)
            context?.addLine(to: topOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: secOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: thirdOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: fourOp)
            context?.strokePath()
        } else if (whichView == 2){
            context?.move(to: buttonOrigin)
            context?.addLine(to: secOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: fourOp)
            context?.strokePath()
        } else if (whichView == 3){
            context?.move(to: buttonOrigin)
            context?.addLine(to: topOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: secOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: thirdOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: fourOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: fiveOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: sixOp)
            context?.strokePath()
        } else if (whichView == 4){
            context?.move(to: buttonOrigin)
            context?.addLine(to: topOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: secOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: thirdOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: fourOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: fiveOp)
            context?.strokePath()
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: sixOp)
            context?.strokePath()
            
            context?.setStrokeColor(UIColor.blue.cgColor)
            context?.move(to: buttonOrigin)
            context?.addLine(to: chosenOp)
            context?.strokePath()
            
            context?.move(to: chosenOp)
            context?.addLine(to: forcedCom)
            context?.strokePath()
        } else if (whichView == 5){
            context?.move(to: buttonOrigin)
            context?.addLine(to: exMidTop)
            
            context?.move(to: exMidTop)
            context?.addLine(to: exForceOne)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: exMidBot)
            
            context?.move(to: exMidBot)
            context?.addLine(to: exForceTwo)
            context?.strokePath()
        } else if (whichView == 6){
            context?.move(to: buttonOrigin)
            context?.addLine(to: ghost)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: robot)
            context?.strokePath()
            
            for cord in combThreeCoord{
                context?.setStrokeColor(UIColor.red.cgColor)
                context?.move(to: ghost)
                context?.addLine(to: cord)
                context?.strokePath()
                
                context?.setStrokeColor(UIColor.blue.cgColor)
                context?.move(to: robot)
                context?.addLine(to: cord)
                context?.strokePath()
                
            }
            
            context?.strokePath()
        } else if (whichView == 7){
            context?.move(to: buttonOrigin)
            context?.addLine(to: topOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: secOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: thirdOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: fourOp)
            
            context?.move(to: buttonOrigin)
            context?.addLine(to: fiveOp)
            
            context?.strokePath()
        }
        
    }

}
