//
//  passwordOneViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 7/30/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class passwordOneViewController: UIViewController {

    @IBOutlet weak var bAA: UIButton!
    @IBOutlet weak var bAB: UIButton!
    @IBOutlet weak var bBA: UIButton!
    @IBOutlet weak var bBB: UIButton!
    
    @IBOutlet weak var lab11: UILabel!
    @IBOutlet weak var lab12: UILabel!
    @IBOutlet weak var lab21: UILabel!
    @IBOutlet weak var lab22: UILabel!
    
    
    private var labAA11: UILabel!
    private var labAA12: UILabel!
    private var labAA21: UILabel!
    private var labAA22: UILabel!
    
    private var labAB11: UILabel!
    private var labAB12: UILabel!
    private var labAB21: UILabel!
    private var labAB22: UILabel!
    
    private var labBA11: UILabel!
    private var labBA12: UILabel!
    private var labBA21: UILabel!
    private var labBA22: UILabel!
    
    private var labBB11: UILabel!
    private var labBB12: UILabel!
    private var labBB21: UILabel!
    private var labBB22: UILabel!
    
    var passArray: [UILabel] = []
    
    private var leftLine: UIView!
    private var rightLine: UIView!
    
    let screenSize = UIScreen.main.bounds
    
    private var aaClicked = false
    private var abClicked = false
    private var baClicked = false
    private var bbClicked = false
    
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        leftLine = UIView(frame: CGRect(x: screenWidth/6,
                                        y: screenHeight/4,
                                        width: 2, height: 400))
        
        leftLine.backgroundColor = UIColor.black
        
        self.view.addSubview(leftLine)
        
        rightLine = UIView(frame: CGRect(x: screenWidth - (screenWidth/6),
                                         y: screenHeight/4,
                                         width: 2, height: 400))
        
        rightLine.backgroundColor = UIColor.black
        
        self.view.addSubview(rightLine)
        
        bAA.frame.origin.x = (screenWidth/6) - bAA.frame.width
        bAA.frame.origin.y = (screenHeight/6) + 100
        
        bAB.frame.origin.x = (screenWidth/6) - bAB.frame.width
        bAB.frame.origin.y = bAA.frame.origin.y + 100
        
        bBA.frame.origin.x = (screenWidth/6) - bBA.frame.width
        bBA.frame.origin.y = bAB.frame.origin.y + 100
        
        bBB.frame.origin.x = (screenWidth/6) - bBB.frame.width
        bBB.frame.origin.y = bBA.frame.origin.y + 100
        
        
        lab11.frame.origin.x = screenWidth - (screenWidth/6)
        lab11.frame.origin.y = (screenHeight/6) + 100
        
        lab12.frame.origin.x = screenWidth - (screenWidth/6)
        lab12.frame.origin.y = lab11.frame.origin.y + 100
        
        lab21.frame.origin.x = screenWidth - (screenWidth/6)
        lab21.frame.origin.y = lab12.frame.origin.y + 100
        
        lab22.frame.origin.x = screenWidth - (screenWidth/6)
        lab22.frame.origin.y = lab21.frame.origin.y + 100
        
        let drawView = view as! drawLineView
        
        drawView.topOp = CGPoint(x: lab11.frame.origin.x,
                                 y: lab11.frame.origin.y + (lab11.frame.height / 2))
        drawView.secOp = CGPoint(x: lab12.frame.origin.x,
                                 y: lab12.frame.origin.y + (lab12.frame.height / 2))
        drawView.thirdOp = CGPoint(x: lab21.frame.origin.x,
                                   y: lab21.frame.origin.y + (lab21.frame.height / 2))
        drawView.fourOp = CGPoint(x: lab22.frame.origin.x,
                                  y: lab22.frame.origin.y + (lab22.frame.height / 2))
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        //tap.cancelsTouchesInView = false
        
        //view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func topAA(_ sender: Any) {
        hideLabels()
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: bAA.frame.origin.x + bAA.frame.width,
                                        y: bAA.frame.origin.y + (bAA.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.setNeedsDisplay()
        if (aaClicked){
            labAA11.isHidden = false
            labAA12.isHidden = false
            labAA21.isHidden = false
            labAA22.isHidden = false
        } else {
            labAA11 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labAA11.center = CGPoint(x: self.view.center.x, y: (bAA.frame.origin.y + lab11.frame.origin.y)/2)
            labAA11.textAlignment = .center
            labAA11.text = "AA11"
            labAA11.isHidden = false
            labAA11.textColor = .black
            self.view.addSubview(labAA11)
            
            labAA12 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labAA12.center = CGPoint(x: self.view.center.x, y: (bAA.frame.origin.y + lab12.frame.origin.y)/2)
            labAA12.textAlignment = .center
            labAA12.text = "AA12"
            labAA12.isHidden = false
            labAA12.textColor = .black
            self.view.addSubview(labAA12)
            
            labAA21 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labAA21.center = CGPoint(x: self.view.center.x, y: (bAA.frame.origin.y + lab21.frame.origin.y)/2)
            labAA21.textAlignment = .center
            labAA21.text = "AA21"
            labAA21.isHidden = false
            labAA21.textColor = .black
            self.view.addSubview(labAA21)
            
            labAA22 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labAA22.center = CGPoint(x: self.view.center.x, y: (bAA.frame.origin.y + lab22.frame.origin.y)/2)
            labAA22.textAlignment = .center
            labAA22.text = "AA22"
            labAA22.isHidden = false
            labAA22.textColor = .black
            self.view.addSubview(labAA22)
            passArray.append(contentsOf: [labAA11, labAA12, labAA21, labAA22])
            aaClicked = true
        }
        if (aaClicked && abClicked && baClicked && bbClicked){
            answer.isHidden = false
        }
        
    }
    
    @IBAction func secAB(_ sender: Any) {
        hideLabels()
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: bAB.frame.origin.x + bAB.frame.width,
                                        y: bAB.frame.origin.y + (bAB.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.setNeedsDisplay()
        if (abClicked){
            labAB11.isHidden = false
            labAB12.isHidden = false
            labAB21.isHidden = false
            labAB22.isHidden = false
        } else {
            labAB11 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labAB11.center = CGPoint(x: self.view.center.x, y: (bAB.frame.origin.y + lab11.frame.origin.y)/2)
            labAB11.textAlignment = .center
            labAB11.text = "AB11"
            labAB11.isHidden = false
            labAB11.textColor = .black
            self.view.addSubview(labAB11)
            
            labAB12 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labAB12.center = CGPoint(x: self.view.center.x, y: (bAB.frame.origin.y + lab12.frame.origin.y)/2)
            labAB12.textAlignment = .center
            labAB12.text = "AB12"
            labAB12.isHidden = false
            labAB12.textColor = .black
            self.view.addSubview(labAB12)
            
            labAB21 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labAB21.center = CGPoint(x: self.view.center.x, y: (bAB.frame.origin.y + lab21.frame.origin.y)/2)
            labAB21.textAlignment = .center
            labAB21.text = "AB21"
            labAB21.isHidden = false
            labAB21.textColor = .black
            self.view.addSubview(labAB21)
            
            labAB22 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labAB22.center = CGPoint(x: self.view.center.x, y: (bAB.frame.origin.y + lab22.frame.origin.y)/2)
            labAB22.textAlignment = .center
            labAB22.text = "AB22"
            labAB22.isHidden = false
            labAB22.textColor = .black
            self.view.addSubview(labAB22)
            passArray.append(contentsOf: [labAB11, labAB12, labAB21, labAB22])
            abClicked = true
        }
        if (aaClicked && abClicked && baClicked && bbClicked){
            answer.isHidden = false
        }
    }
    
    @IBAction func threeBA(_ sender: Any) {
        hideLabels()
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: bBA.frame.origin.x + bBA.frame.width,
                                        y: bBA.frame.origin.y + (bBA.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.setNeedsDisplay()
        if (baClicked){
            labBA11.isHidden = false
            labBA12.isHidden = false
            labBA21.isHidden = false
            labBA22.isHidden = false
        } else {
            labBA11 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labBA11.center = CGPoint(x: self.view.center.x, y: (bBA.frame.origin.y + lab11.frame.origin.y)/2)
            labBA11.textAlignment = .center
            labBA11.text = "BA11"
            labBA11.isHidden = false
            labBA11.textColor = .black
            self.view.addSubview(labBA11)
            
            labBA12 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labBA12.center = CGPoint(x: self.view.center.x, y: (bBA.frame.origin.y + lab12.frame.origin.y)/2)
            labBA12.textAlignment = .center
            labBA12.text = "BA12"
            labBA12.isHidden = false
            labBA12.textColor = .black
            self.view.addSubview(labBA12)
            
            labBA21 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labBA21.center = CGPoint(x: self.view.center.x, y: (bBA.frame.origin.y + lab21.frame.origin.y)/2)
            labBA21.textAlignment = .center
            labBA21.text = "BA21"
            labBA21.isHidden = false
            labBA21.textColor = .black
            self.view.addSubview(labBA21)
            
            labBA22 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labBA22.center = CGPoint(x: self.view.center.x, y: (bBA.frame.origin.y + lab22.frame.origin.y)/2)
            labBA22.textAlignment = .center
            labBA22.text = "BA22"
            labBA22.isHidden = false
            labBA22.textColor = .black
            self.view.addSubview(labBA22)
            passArray.append(contentsOf: [labBA11, labBA12, labBA21, labBA22])
            baClicked = true
        }
        if (aaClicked && abClicked && baClicked && bbClicked){
            answer.isHidden = false
        }
    }
    
    @IBAction func fourBB(_ sender: Any) {
        hideLabels()
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: bBB.frame.origin.x + bBB.frame.width,
                                        y: bBB.frame.origin.y + (bBB.frame.height / 2))
        drawView.currentColor = UIColor.green
        drawView.setNeedsDisplay()
        if (bbClicked){
            labBB11.isHidden = false
            labBB12.isHidden = false
            labBB21.isHidden = false
            labBB22.isHidden = false
        } else {
            labBB11 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labBB11.center = CGPoint(x: self.view.center.x, y: (bBB.frame.origin.y + lab11.frame.origin.y)/2)
            labBB11.textAlignment = .center
            labBB11.text = "BB11"
            labBB11.isHidden = false
            labBB11.textColor = .black
            self.view.addSubview(labBB11)
            
            labBB12 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labBB12.center = CGPoint(x: self.view.center.x, y: (bBB.frame.origin.y + lab12.frame.origin.y)/2)
            labBB12.textAlignment = .center
            labBB12.text = "BB12"
            labBB12.isHidden = false
            labBB12.textColor = .black
            self.view.addSubview(labBB12)
            
            labBB21 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labBB21.center = CGPoint(x: self.view.center.x, y: (bBB.frame.origin.y + lab21.frame.origin.y)/2)
            labBB21.textAlignment = .center
            labBB21.text = "BB21"
            labBB21.isHidden = false
            labBB21.textColor = .black
            self.view.addSubview(labBB21)
            
            labBB22 = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            labBB22.center = CGPoint(x: self.view.center.x, y: (bBB.frame.origin.y + lab22.frame.origin.y)/2)
            labBB22.textAlignment = .center
            labBB22.text = "BB22"
            labBB22.isHidden = false
            labBB22.textColor = .black
            self.view.addSubview(labBB22)
            passArray.append(contentsOf: [labBB11, labBB12, labBB21, labBB22])
            bbClicked = true
        }
        if (aaClicked && abClicked && baClicked && bbClicked){
            answer.isHidden = false
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
    
    func hideLabels(){
        for label in passArray{
            label.isHidden = true
        }
    }

}
