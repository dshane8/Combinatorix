//
//  passwordThreeViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 7/30/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class passwordThreeViewController: UIViewController {

    @IBOutlet weak var aBut: UIButton!
    @IBOutlet weak var bBut: UIButton!
    @IBOutlet weak var cBut: UIButton!
    @IBOutlet weak var dBut: UIButton!
    @IBOutlet weak var eBut: UIButton!
    
    @IBOutlet weak var butAB: UIButton!
    @IBOutlet weak var butAC: UIButton!
    @IBOutlet weak var butAD: UIButton!
    @IBOutlet weak var butAE: UIButton!
    @IBOutlet weak var butBC: UIButton!
    @IBOutlet weak var butBD: UIButton!
    @IBOutlet weak var butBE: UIButton!
    @IBOutlet weak var butCD: UIButton!
    @IBOutlet weak var butCE: UIButton!
    @IBOutlet weak var butDE: UIButton!
    
    @IBOutlet weak var labAB: UILabel!
    @IBOutlet weak var labAC: UILabel!
    @IBOutlet weak var labAD: UILabel!
    @IBOutlet weak var labAE: UILabel!
    @IBOutlet weak var labBC: UILabel!
    @IBOutlet weak var labBD: UILabel!
    @IBOutlet weak var labBE: UILabel!
    @IBOutlet weak var labCD: UILabel!
    @IBOutlet weak var labCE: UILabel!
    @IBOutlet weak var labDE: UILabel!
    
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var nextSub: UIButton!
    @IBOutlet weak var topAns: UITextField!
    @IBOutlet weak var botAns: UITextField!
    @IBOutlet weak var parenthesis: UILabel!
    
    var firstChosen = -1
    var stage = 0
    
    var leftButArray: [UIButton] = []
    var midButArray: [UIButton] = []
    var rightLabArray: [UILabel] = []
    
    private var leftLine: UIView!
    private var midLine: UIView!
    private var rightLine: UIView!
    
    let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        leftLine = UIView(frame: CGRect(x: screenWidth/7,
                                        y: screenHeight/4,
                                        width: 2, height: 425))
        
        leftLine.backgroundColor = UIColor.black
        
        self.view.addSubview(leftLine)
        
        midLine = UIView(frame: CGRect(x: self.view.center.x,
                                       y: screenHeight/4,
                                       width: 2, height: 425))
        
        midLine.backgroundColor = UIColor.black
        
        self.view.addSubview(midLine)
        
        rightLine = UIView(frame: CGRect(x: screenWidth - (screenWidth/7),
                                         y: screenHeight/4,
                                         width: 2, height: 425))
        
        rightLine.backgroundColor = UIColor.black
        
        self.view.addSubview(rightLine)
        
        leftButArray.append(contentsOf: [aBut, bBut, cBut, dBut, eBut])
        midButArray.append(contentsOf: [butAB, butAC, butAD, butAE, butBC,
                                        butBD, butBE, butCD, butCE, butDE])
        rightLabArray.append(contentsOf: [labAB, labAC, labAD, labAE, labBC,
                                          labBD, labBE, labCD, labCE, labDE])
        
        setButtons(initX: leftLine.frame.origin.x, initY: leftLine.frame.origin.y + 100,
                   butArray: leftButArray)
        setButtons(initX: midLine.frame.origin.x, initY: midLine.frame.origin.y + 10,
                   butArray: midButArray)
        setLabels(initX: rightLine.frame.origin.x, initY: rightLine.frame.origin.y + 10, labArray: rightLabArray)
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        //tap.cancelsTouchesInView = false
        
        //view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButtons(initX: CGFloat, initY: CGFloat, butArray: [UIButton]){
        var newY = initY + 10
        for btn in butArray{
            btn.frame.origin.x = initX - btn.frame.width
            btn.frame.origin.y = newY
            newY += 40
        }
    }
    
    func setLabels(initX: CGFloat, initY: CGFloat, labArray: [UILabel]){
        var newY = initY + 10
        for lab in labArray{
            lab.frame.origin.x = initX
            lab.frame.origin.y = newY
            newY += 40
        }
    }
    
    func enableButtons(butArray: [UIButton]){
        for btn in butArray{
            btn.isEnabled = true
        }
    }
    
    func disableButtons(butArray: [UIButton]){
        for btn in butArray{
            btn.isEnabled = false
        }
    }
    
    @IBAction func aButPressed(_ sender: Any) {
        enableButtons(butArray: midButArray)
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: aBut.frame.origin.x + aBut.frame.width,
                                        y: aBut.frame.origin.y + (aBut.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.whichView = 3
        drawView.topOp = CGPoint(x: butBC.frame.origin.x,
                                 y: butBC.frame.origin.y + (butBC.frame.height / 2))
        drawView.secOp = CGPoint(x: butBD.frame.origin.x,
                                 y: butBD.frame.origin.y + (butBD.frame.height / 2))
        drawView.thirdOp = CGPoint(x: butBE.frame.origin.x,
                                   y: butBE.frame.origin.y + (butBE.frame.height / 2))
        drawView.fourOp = CGPoint(x: butCD.frame.origin.x,
                                  y: butCD.frame.origin.y + (butCD.frame.height / 2))
        drawView.fiveOp = CGPoint(x: butCE.frame.origin.x,
                                  y: butCE.frame.origin.y + (butCE.frame.height / 2))
        drawView.sixOp = CGPoint(x: butDE.frame.origin.x,
                                 y: butDE.frame.origin.y + (butDE.frame.height / 2))
        drawView.setNeedsDisplay()
        butAB.isEnabled = false
        butAC.isEnabled = false
        butAD.isEnabled = false
        butAE.isEnabled = false
        firstChosen = 0
    }
    
    @IBAction func bButPressed(_ sender: Any) {
        enableButtons(butArray: midButArray)
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: bBut.frame.origin.x + bBut.frame.width,
                                        y: bBut.frame.origin.y + (bBut.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.whichView = 3
        drawView.topOp = CGPoint(x: butAC.frame.origin.x,
                                 y: butAC.frame.origin.y + (butAC.frame.height / 2))
        drawView.secOp = CGPoint(x: butAD.frame.origin.x,
                                 y: butAD.frame.origin.y + (butAD.frame.height / 2))
        drawView.thirdOp = CGPoint(x: butAE.frame.origin.x,
                                   y: butAE.frame.origin.y + (butAE.frame.height / 2))
        drawView.fourOp = CGPoint(x: butCD.frame.origin.x,
                                  y: butCD.frame.origin.y + (butCD.frame.height / 2))
        drawView.fiveOp = CGPoint(x: butCE.frame.origin.x,
                                  y: butCE.frame.origin.y + (butCE.frame.height / 2))
        drawView.sixOp = CGPoint(x: butDE.frame.origin.x,
                                 y: butDE.frame.origin.y + (butDE.frame.height / 2))
        drawView.setNeedsDisplay()
        butAB.isEnabled = false
        butBC.isEnabled = false
        butBD.isEnabled = false
        butBE.isEnabled = false
        firstChosen = 1
    }
    
    @IBAction func cButPressed(_ sender: Any) {
        enableButtons(butArray: midButArray)
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: cBut.frame.origin.x + cBut.frame.width,
                                        y: cBut.frame.origin.y + (cBut.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.whichView = 3
        drawView.topOp = CGPoint(x: butAB.frame.origin.x,
                                 y: butAB.frame.origin.y + (butAB.frame.height / 2))
        drawView.secOp = CGPoint(x: butAD.frame.origin.x,
                                 y: butAD.frame.origin.y + (butAD.frame.height / 2))
        drawView.thirdOp = CGPoint(x: butAE.frame.origin.x,
                                   y: butAE.frame.origin.y + (butAE.frame.height / 2))
        drawView.fourOp = CGPoint(x: butBD.frame.origin.x,
                                  y: butBD.frame.origin.y + (butBD.frame.height / 2))
        drawView.fiveOp = CGPoint(x: butBE.frame.origin.x,
                                  y: butBE.frame.origin.y + (butBE.frame.height / 2))
        drawView.sixOp = CGPoint(x: butDE.frame.origin.x,
                                 y: butDE.frame.origin.y + (butDE.frame.height / 2))
        drawView.setNeedsDisplay()
        butAC.isEnabled = false
        butBC.isEnabled = false
        butCD.isEnabled = false
        butCE.isEnabled = false
        firstChosen = 2
    }
    
    @IBAction func dButPressed(_ sender: Any) {
        enableButtons(butArray: midButArray)
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: dBut.frame.origin.x + dBut.frame.width,
                                        y: dBut.frame.origin.y + (dBut.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.whichView = 3
        drawView.topOp = CGPoint(x: butAB.frame.origin.x,
                                 y: butAB.frame.origin.y + (butAB.frame.height / 2))
        drawView.secOp = CGPoint(x: butAC.frame.origin.x,
                                 y: butAC.frame.origin.y + (butAC.frame.height / 2))
        drawView.thirdOp = CGPoint(x: butAE.frame.origin.x,
                                   y: butAE.frame.origin.y + (butAE.frame.height / 2))
        drawView.fourOp = CGPoint(x: butBC.frame.origin.x,
                                  y: butBC.frame.origin.y + (butBC.frame.height / 2))
        drawView.fiveOp = CGPoint(x: butBE.frame.origin.x,
                                  y: butBE.frame.origin.y + (butBE.frame.height / 2))
        drawView.sixOp = CGPoint(x: butCE.frame.origin.x,
                                 y: butCE.frame.origin.y + (butCE.frame.height / 2))
        drawView.setNeedsDisplay()
        butAD.isEnabled = false
        butBD.isEnabled = false
        butCD.isEnabled = false
        butDE.isEnabled = false
        firstChosen = 3
    }
    
    @IBAction func eButPressed(_ sender: Any) {
        enableButtons(butArray: midButArray)
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: eBut.frame.origin.x + eBut.frame.width,
                                        y: eBut.frame.origin.y + (eBut.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.whichView = 3
        drawView.topOp = CGPoint(x: butAB.frame.origin.x,
                                 y: butAB.frame.origin.y + (butAB.frame.height / 2))
        drawView.secOp = CGPoint(x: butAC.frame.origin.x,
                                 y: butAC.frame.origin.y + (butAC.frame.height / 2))
        drawView.thirdOp = CGPoint(x: butAD.frame.origin.x,
                                   y: butAD.frame.origin.y + (butAD.frame.height / 2))
        drawView.fourOp = CGPoint(x: butBC.frame.origin.x,
                                  y: butBC.frame.origin.y + (butBC.frame.height / 2))
        drawView.fiveOp = CGPoint(x: butBD.frame.origin.x,
                                  y: butBD.frame.origin.y + (butBD.frame.height / 2))
        drawView.sixOp = CGPoint(x: butCD.frame.origin.x,
                                 y: butCD.frame.origin.y + (butCD.frame.height / 2))
        drawView.setNeedsDisplay()
        butAE.isEnabled = false
        butBE.isEnabled = false
        butCE.isEnabled = false
        butDE.isEnabled = false
        firstChosen = 4
    }
    
    @IBAction func abPressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butAB.frame.origin.x + butAB.frame.width,
                                    y: butAB.frame.origin.y + (butAB.frame.height / 2))
        if (firstChosen == 2){
            drawView.forcedCom = CGPoint(x: labDE.frame.origin.x,
                                         y: labDE.frame.origin.y + (labDE.frame.height / 2))
        } else if (firstChosen == 3){
            drawView.forcedCom = CGPoint(x: labCE.frame.origin.x,
                                         y: labCE.frame.origin.y + (labCE.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labCD.frame.origin.x,
                                         y: labCD.frame.origin.y + (labCD.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func acPressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butAC.frame.origin.x + butAC.frame.width,
                                    y: butAC.frame.origin.y + (butAC.frame.height / 2))
        if (firstChosen == 1){
            drawView.forcedCom = CGPoint(x: labDE.frame.origin.x,
                                         y: labDE.frame.origin.y + (labDE.frame.height / 2))
        } else if (firstChosen == 3){
            drawView.forcedCom = CGPoint(x: labBE.frame.origin.x,
                                         y: labBE.frame.origin.y + (labBE.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labBD.frame.origin.x,
                                         y: labBD.frame.origin.y + (labBD.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func adPressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butAD.frame.origin.x + butAD.frame.width,
                                    y: butAD.frame.origin.y + (butAD.frame.height / 2))
        if (firstChosen == 1){
            drawView.forcedCom = CGPoint(x: labCE.frame.origin.x,
                                         y: labCE.frame.origin.y + (labCE.frame.height / 2))
        } else if (firstChosen == 2){
            drawView.forcedCom = CGPoint(x: labBE.frame.origin.x,
                                         y: labBE.frame.origin.y + (labBE.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labBC.frame.origin.x,
                                         y: labBC.frame.origin.y + (labBC.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func aePressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butAE.frame.origin.x + butAE.frame.width,
                                    y: butAE.frame.origin.y + (butAE.frame.height / 2))
        if (firstChosen == 1){
            drawView.forcedCom = CGPoint(x: labCD.frame.origin.x,
                                         y: labCD.frame.origin.y + (labCD.frame.height / 2))
        } else if (firstChosen == 2){
            drawView.forcedCom = CGPoint(x: labBD.frame.origin.x,
                                         y: labBD.frame.origin.y + (labBD.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labBC.frame.origin.x,
                                         y: labBC.frame.origin.y + (labBC.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func bcPressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butBC.frame.origin.x + butBC.frame.width,
                                    y: butBC.frame.origin.y + (butBC.frame.height / 2))
        if (firstChosen == 0){
            drawView.forcedCom = CGPoint(x: labDE.frame.origin.x,
                                         y: labDE.frame.origin.y + (labDE.frame.height / 2))
        } else if (firstChosen == 3){
            drawView.forcedCom = CGPoint(x: labAE.frame.origin.x,
                                         y: labAE.frame.origin.y + (labAE.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labAD.frame.origin.x,
                                         y: labAD.frame.origin.y + (labAD.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func bdPressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butBD.frame.origin.x + butBD.frame.width,
                                    y: butBD.frame.origin.y + (butBD.frame.height / 2))
        if (firstChosen == 0){
            drawView.forcedCom = CGPoint(x: labCE.frame.origin.x,
                                         y: labCE.frame.origin.y + (labCE.frame.height / 2))
        } else if (firstChosen == 2){
            drawView.forcedCom = CGPoint(x: labAE.frame.origin.x,
                                         y: labAE.frame.origin.y + (labAE.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labAC.frame.origin.x,
                                         y: labAC.frame.origin.y + (labAC.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func bePressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butBE.frame.origin.x + butBE.frame.width,
                                    y: butBE.frame.origin.y + (butBE.frame.height / 2))
        if (firstChosen == 0){
            drawView.forcedCom = CGPoint(x: labCD.frame.origin.x,
                                         y: labCD.frame.origin.y + (labCD.frame.height / 2))
        } else if (firstChosen == 2){
            drawView.forcedCom = CGPoint(x: labAD.frame.origin.x,
                                         y: labAD.frame.origin.y + (labAD.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labAC.frame.origin.x,
                                         y: labAC.frame.origin.y + (labAC.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func cdPressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butCD.frame.origin.x + butCD.frame.width,
                                    y: butCD.frame.origin.y + (butCD.frame.height / 2))
        if (firstChosen == 0){
            drawView.forcedCom = CGPoint(x: labBE.frame.origin.x,
                                         y: labBE.frame.origin.y + (labBE.frame.height / 2))
        } else if (firstChosen == 1){
            drawView.forcedCom = CGPoint(x: labAE.frame.origin.x,
                                         y: labAE.frame.origin.y + (labAE.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labAB.frame.origin.x,
                                         y: labAB.frame.origin.y + (labAB.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func cePressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butCE.frame.origin.x + butCE.frame.width,
                                    y: butCE.frame.origin.y + (butCE.frame.height / 2))
        if (firstChosen == 0){
            drawView.forcedCom = CGPoint(x: labBD.frame.origin.x,
                                         y: labBD.frame.origin.y + (labBD.frame.height / 2))
        } else if (firstChosen == 1){
            drawView.forcedCom = CGPoint(x: labAD.frame.origin.x,
                                         y: labAD.frame.origin.y + (labAD.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labAB.frame.origin.x,
                                         y: labAB.frame.origin.y + (labAB.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func dePressed(_ sender: Any) {
        if (stage < 5){
            return
        }
        let drawView = view as! drawLineView
        drawView.chosenOp = CGPoint(x: butDE.frame.origin.x + butDE.frame.width,
                                    y: butDE.frame.origin.y + (butDE.frame.height / 2))
        if (firstChosen == 0){
            drawView.forcedCom = CGPoint(x: labBC.frame.origin.x,
                                         y: labBC.frame.origin.y + (labBC.frame.height / 2))
        } else if (firstChosen == 1){
            drawView.forcedCom = CGPoint(x: labAC.frame.origin.x,
                                         y: labAC.frame.origin.y + (labAC.frame.height / 2))
        } else {
            drawView.forcedCom = CGPoint(x: labAD.frame.origin.x,
                                         y: labAD.frame.origin.y + (labAD.frame.height / 2))
        }
        drawView.currentColor = UIColor.green
        drawView.whichView = 4
        drawView.setNeedsDisplay()
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if (stage == 0){
            prompt.text = "How many people could be the leader?"
            showAnswers()
            nextSub.setTitle("Submit", for: .normal)
            stage += 1
        } else if (stage == 1){
            if (topAns.text == "5" && botAns.text == "1"){
                prompt.text = "Correct! Below are the 5 possible leaders. Press next."
                hideAnswers()
                topAns.text = ""
                botAns.text = ""
                nextSub.setTitle("Next", for: .normal)
                showButtons(butArray: leftButArray)
                stage += 1
            } else {
                prompt.text = "False. How many people could be a leader of the 5 choices?"
                topAns.text = ""
                botAns.text = ""
            }
        } else if (stage == 2){
            prompt.text = "After choosing a leader, how many ways can you create a committe of two?"
            showAnswers()
            nextSub.setTitle("Submit", for: .normal)
            stage += 1
        } else if (stage == 3){
            if (topAns.text == "4" && botAns.text == "2"){
                prompt.text = "Correct! Below are all possible committe combinations. Choose a leader to see which committees could be made."
                hideAnswers()
                topAns.text = ""
                botAns.text = ""
                enableButtons(butArray: leftButArray)
                nextSub.setTitle("Next", for: .normal)
                showButtons(butArray: midButArray)
                stage += 1
            } else {
                prompt.text = "False. Of the four remaining people, how many committes of two can be made?"
                topAns.text = ""
                botAns.text = ""
            }
        } else if (stage == 4){
            prompt.text = "Now that you've chosen the leader, after choosing the first committee you will only be left with two people for the last comittee."
            showLabels(labArray: rightLabArray)
            stage += 1
        } else if (stage == 5){
            prompt.text = "Select a leader and a first committee to demonstrate this concept. Press next when ready."
            stage += 1
        } else if (stage == 6){
            prompt.text = "However, there is a problem; we've counted twice. These two configurations are the same, but we've counted both of them."
            disableButtons(butArray: leftButArray)
            disableButtons(butArray: midButArray)
            let drawView = view as! drawLineView
            
            drawView.buttonOrigin = CGPoint(x: cBut.frame.origin.x + cBut.frame.width,
                                            y: cBut.frame.origin.y + (cBut.frame.height / 2))
            
            drawView.exMidTop = CGPoint(x: butAD.frame.origin.x + butAD.frame.width,
                                        y: butAD.frame.origin.y + (butAD.frame.height / 2))
            
            drawView.exForceOne = CGPoint(x: labBE.frame.origin.x,
                                          y: labBE.frame.origin.y + (labBE.frame.height / 2))
            
            drawView.exMidBot = CGPoint(x: butBE.frame.origin.x + butBE.frame.width,
                                        y: butBE.frame.origin.y + (butBE.frame.height / 2))
            
            drawView.exForceTwo = CGPoint(x: labAD.frame.origin.x,
                                          y: labAD.frame.origin.y + (labAD.frame.height / 2))
            
            drawView.currentColor = UIColor.red
            drawView.whichView = 5
            drawView.setNeedsDisplay()
            stage += 1
        } else if (stage == 7){
            prompt.text = "Therefore, we must divide by two since each configuration has a duplicate. Thus making our answer (5c1 × 4c2 × 2c2) / 2."
        }
        
    }
    
    func hideAnswers(){
        topAns.isHidden = true
        botAns.isHidden = true
        parenthesis.isHidden = true
    }
    
    func showAnswers(){
        topAns.isHidden = false
        botAns.isHidden = false
        parenthesis.isHidden = false
    }
    
    func showButtons(butArray: [UIButton]){
        for btn in butArray{
            btn.isHidden = false
        }
    }
    
    func showLabels(labArray: [UILabel]){
        for lab in labArray{
            lab.isHidden = false
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
