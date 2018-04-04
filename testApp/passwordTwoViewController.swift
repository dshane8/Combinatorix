//
//  passwordTwoViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 7/30/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class passwordTwoViewController: UIViewController {

    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonX: UIButton!
    
    @IBOutlet weak var labCC: UILabel!
    @IBOutlet weak var labCD: UILabel!
    @IBOutlet weak var labDC: UILabel!
    @IBOutlet weak var labDD: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    private var labACC: UILabel!
    private var labACD: UILabel!
    private var labADC: UILabel!
    private var labADD: UILabel!
    
    private var labXCD: UILabel!
    private var labXDD: UILabel!
    
    var passArray: [UILabel] = []
    
    private var aClicked = false
    private var xClicked = false
    
    private var leftLine: UIView!
    private var rightLine: UIView!
    
    let screenSize = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        leftLine = UIView(frame: CGRect(x: screenWidth/6,
                                        y: screenHeight/3,
                                        width: 2, height: 300))
        
        leftLine.backgroundColor = UIColor.black
        
        self.view.addSubview(leftLine)
        
        rightLine = UIView(frame: CGRect(x: screenWidth - (screenWidth/6),
                                         y: screenHeight/3,
                                         width: 2, height: 300))
        
        rightLine.backgroundColor = UIColor.black
        
        self.view.addSubview(rightLine)
        
        buttonA.frame.origin.x = (screenWidth/6) - buttonA.frame.width
        buttonA.frame.origin.y = (screenHeight/6) + 150
        
        buttonX.frame.origin.x = (screenWidth/6) - buttonX.frame.width
        buttonX.frame.origin.y = buttonA.frame.origin.y + 200
        
        labCC.frame.origin.x = screenWidth - (screenWidth/6)
        labCC.frame.origin.y = (screenHeight/6) + 100
        
        labCD.frame.origin.x = screenWidth - (screenWidth/6)
        labCD.frame.origin.y = labCC.frame.origin.y + 100
        
        labDC.frame.origin.x = screenWidth - (screenWidth/6)
        labDC.frame.origin.y = labCD.frame.origin.y + 100
        
        labDD.frame.origin.x = screenWidth - (screenWidth/6)
        labDD.frame.origin.y = labDC.frame.origin.y + 100
        
        let drawView = view as! drawLineView
        
        drawView.topOp = CGPoint(x: labCC.frame.origin.x,
                                 y: labCC.frame.origin.y + (labCC.frame.height / 2))
        drawView.secOp = CGPoint(x: labCD.frame.origin.x,
                                 y: labCD.frame.origin.y + (labCD.frame.height / 2))
        drawView.thirdOp = CGPoint(x: labDC.frame.origin.x,
                                   y: labDC.frame.origin.y + (labDC.frame.height / 2))
        drawView.fourOp = CGPoint(x: labDD.frame.origin.x,
                                  y: labDD.frame.origin.y + (labDD.frame.height / 2))
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        //tap.cancelsTouchesInView = false
        
        //view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func aPressed(_ sender: Any) {
        hideLabels()
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: buttonA.frame.origin.x + buttonA.frame.width,
                                        y: buttonA.frame.origin.y + (buttonA.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.whichView = 1
        drawView.setNeedsDisplay()
        if (aClicked){
            labACC.isHidden = false
            labACD.isHidden = false
            labADC.isHidden = false
            labADD.isHidden = false
        } else {
            labACC = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labACC.center = CGPoint(x: self.view.center.x, y: (buttonA.frame.origin.y + labCC.frame.origin.y)/2)
            labACC.textAlignment = .center
            labACC.text = "ACC"
            labACC.isHidden = false
            labACC.textColor = .black
            self.view.addSubview(labACC)
            
            labACD = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labACD.center = CGPoint(x: self.view.center.x, y: (buttonA.frame.origin.y + labCD.frame.origin.y)/2)
            labACD.textAlignment = .center
            labACD.text = "ACD"
            labACD.isHidden = false
            labACD.textColor = .black
            self.view.addSubview(labACD)
            
            labADC = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labADC.center = CGPoint(x: self.view.center.x, y: (buttonA.frame.origin.y + labDC.frame.origin.y)/2)
            labADC.textAlignment = .center
            labADC.text = "ADC"
            labADC.isHidden = false
            labADC.textColor = .black
            self.view.addSubview(labADC)
            
            labADD = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labADD.center = CGPoint(x: self.view.center.x, y: (buttonA.frame.origin.y + labDD.frame.origin.y)/2)
            labADD.textAlignment = .center
            labADD.text = "ADD"
            labADD.isHidden = false
            labADD.textColor = .black
            self.view.addSubview(labADD)
            passArray.append(contentsOf: [labACC, labACD, labADC, labADD])
            aClicked = true
        }
        if (aClicked && xClicked){
            answer.isHidden = false
        }
    }
    
    @IBAction func xPressed(_ sender: Any) {
        hideLabels()
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: buttonX.frame.origin.x + buttonX.frame.width,
                                        y: buttonX.frame.origin.y + (buttonX.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.whichView = 2
        drawView.setNeedsDisplay()
        if (xClicked){
            labXCD.isHidden = false
            labXDD.isHidden = false
        } else {
            labXCD = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labXCD.center = CGPoint(x: self.view.center.x, y: (buttonX.frame.origin.y + labCD.frame.origin.y)/2)
            labXCD.textAlignment = .center
            labXCD.text = "XCD"
            labXCD.isHidden = false
            labXCD.textColor = .black
            self.view.addSubview(labXCD)
            
            labXDD = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labXDD.center = CGPoint(x: self.view.center.x, y: (buttonX.frame.origin.y + labDD.frame.origin.y)/2)
            labXDD.textAlignment = .center
            labXDD.text = "XDD"
            labXDD.isHidden = false
            labXDD.textColor = .black
            self.view.addSubview(labXDD)
            passArray.append(contentsOf: [labXCD, labXDD])
            xClicked = true
        }
        if (aClicked && xClicked){
            answer.isHidden = false
        }
    }
    
    func hideLabels(){
        for label in passArray{
            label.isHidden = true
        }
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
