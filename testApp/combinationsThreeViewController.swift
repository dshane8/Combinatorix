//
//  combinationsThreeViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 8/9/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class combinationsThreeViewController: UIViewController {

    @IBOutlet weak var boysOne: UIButton!
    @IBOutlet weak var boysTwo: UIButton!
    @IBOutlet weak var boysThree: UIButton!
    
    @IBOutlet weak var ghost: UILabel!
    @IBOutlet weak var robot: UILabel!
    
    @IBOutlet weak var girlsOne: UILabel!
    @IBOutlet weak var girlsTwo: UILabel!
    @IBOutlet weak var girlsThree: UILabel!
    
    @IBOutlet weak var parenthesis: UILabel!
    @IBOutlet weak var topAns: UITextField!
    @IBOutlet weak var botAns: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var nextBut: UIButton!
    
    private var boyPairs: [UIButton] = []
    private var ghostBot: [UILabel] = []
    private var girlPairs: [UILabel] = []
    
    private var stage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prompt.text = "How many committees of five can be be made from the 8 possible members above if each committee must have two boys, one 'monster', and two girls?"
        
        boyPairs.append(contentsOf: [boysOne, boysTwo, boysThree])
        ghostBot.append(contentsOf: [ghost, robot])
        girlPairs.append(contentsOf: [girlsOne, girlsTwo, girlsThree])
        
        
        let girlsOneCoord = CGPoint(x: girlsOne.frame.origin.x, y: girlsOne.frame.origin.y + (0.5 * girlsOne.frame.height))
        
        let girlsTwoCoord = CGPoint(x: girlsTwo.frame.origin.x, y: girlsTwo.frame.origin.y + (0.5 * girlsTwo.frame.height))
        
        let girlsThreeCoord = CGPoint(x: girlsThree.frame.origin.x, y: girlsThree.frame.origin.y + (0.5 * girlsThree.frame.height))
        
        setUpDraw(girlOne: girlsOneCoord, girlTwo: girlsTwoCoord, girlThree: girlsThreeCoord)
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        //tap.cancelsTouchesInView = false
        
       // view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if (stage == 0){
            prompt.text = "Let's start with choosing the boys for our committee. How many ways can you choose two boys from what is available above?"
            showResponseTools()
        } else if (stage == 1){
            prompt.text = "Now let's look at the monsters. How many ways can you choose one monster from the monsters available?"
            showResponseTools()
        } else if (stage == 2){
            prompt.text = "Now let's look at the girls. How many ways can you choose two girls from the girls available?"
            showResponseTools()
        } else if (stage == 3){
            prompt.text = "Great! Above we can see all the possible configurations of each group."
            enableButtons()
        }
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if (stage == 0){
            if (topAns.text == "3" && botAns.text == "2"){
                prompt.text = "Correct! You have three boys to choose from, and we need two for our committee. Above you can see the possible configurations. Press next."
                showPairs(pairArray: girlPairs, button: true)
                hideResponseTools()
                stage += 1
            } else {
                prompt.text = "Incorrect. How many boys do you have to choose from and how many do you need?"
            }
        } else if (stage == 1){
            if (topAns.text == "2" && botAns.text == "1"){
                prompt.text = "Correct! You have two monsters to choose from, and we only need one to form our committee. Press next."
                showPairs(pairArray: ghostBot, button: false)
                hideResponseTools()
                stage += 1
            } else{
                prompt.text = "Incorrect. How many monsters do you have to choose from and how many monsters do you need?"
            }
        } else if (stage == 2){
            if (topAns.text == "3" && botAns.text == "2"){
                prompt.text = "Correct! There are three girls to choose from, and we need two for our committee. Press next."
                showPairs(pairArray: girlPairs, button: false)
                hideResponseTools()
                stage += 1
            } else {
                prompt.text = "Incorrect. How many girls do you have to choose from and how many do you need?"
            }
        }
    }
    
    @IBAction func boysOnePressed(_ sender: Any) {
        let drawView = view as! drawLineView
        drawView.whichView = 6
        drawView.buttonOrigin = CGPoint(x: boysOne.frame.origin.x + boysOne.frame.width,
                                        y: boysOne.frame.origin.y + (boysOne.frame.height / 2))
        drawView.currentColor = UIColor.purple
        drawView.setNeedsDisplay()
    }
    
    @IBAction func boysTwoPressed(_ sender: Any) {
        let drawView = view as! drawLineView
        drawView.whichView = 6
        drawView.buttonOrigin = CGPoint(x: boysTwo.frame.origin.x + boysTwo.frame.width,
                                        y: boysTwo.frame.origin.y + (boysTwo.frame.height / 2))
        drawView.currentColor = UIColor.purple
        drawView.setNeedsDisplay()
    }
    
    @IBAction func boysThreePressed(_ sender: Any) {
        let drawView = view as! drawLineView
        drawView.whichView = 6
        drawView.buttonOrigin = CGPoint(x: boysThree.frame.origin.x + boysThree.frame.width,
                                        y: boysThree.frame.origin.y + (boysThree.frame.height / 2))
        drawView.currentColor = UIColor.purple
        drawView.setNeedsDisplay()
    }
    
    func showResponseTools(){
        parenthesis.isHidden = false
        topAns.isHidden = false
        botAns.isHidden = false
        submit.isHidden = false
        nextBut.isEnabled = false
    }
    
    func hideResponseTools(){
        parenthesis.isHidden = true
        topAns.isHidden = true
        botAns.isHidden = true
        submit.isHidden = true
        nextBut.isEnabled = true
        
        topAns.text = ""
        botAns.text = ""
    }
    
    func showPairs(pairArray: [UILabel], button: Bool){
        if (button){
            for pair in boyPairs{
                pair.isHidden = false
            }
        } else {
            for pair in pairArray{
                pair.isHidden = false
            }
        }
    }
    
    func enableButtons(){
        for btn in boyPairs{
            btn.isEnabled = true
        }
    }
    
    func setUpDraw(girlOne: CGPoint, girlTwo: CGPoint, girlThree: CGPoint){
        let drawView = view as! drawLineView
        
        
        drawView.combThreeCoord.append(contentsOf: [girlOne, girlTwo, girlThree])
        drawView.ghost = CGPoint(x: ghost.frame.origin.x + (0.5 * ghost.frame.width),
                                 y: ghost.frame.origin.y + (ghost.frame.height / 2))
        drawView.robot = CGPoint(x: robot.frame.origin.x + (0.5 * robot.frame.width),
                                 y: robot.frame.origin.y + (robot.frame.height / 2))
        
        
    }
    
    @IBAction func reset(_ sender: Any) {
    }

}
