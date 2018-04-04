//
//  computerViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 8/10/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class computerViewController: UIViewController {

    @IBOutlet weak var onlyH: UILabel!
    
    @IBOutlet weak var hPairOne: UIButton!
    @IBOutlet weak var hPairTwo: UIButton!
    @IBOutlet weak var hPairThree: UIButton!
    
    @IBOutlet weak var lowOne: UILabel!
    @IBOutlet weak var lowTwo: UILabel!
    @IBOutlet weak var lowThree: UILabel!
    @IBOutlet weak var lowFour: UILabel!
    @IBOutlet weak var lowFive: UILabel!
    
    @IBOutlet weak var parenthesis: UILabel!
    @IBOutlet weak var topAns: UITextField!
    @IBOutlet weak var botAns: UITextField!
    @IBOutlet weak var subButton: UIButton!
    
    private var highProg: [UIButton] = []
    private var lowProg: [UILabel] = []
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prompt: UILabel!
    
    private var stage = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prompt.text = "Suppose we have 8 programs that can run on a computer, three are high priority, and five are low priority. Only three programs can run at once."
        highProg.append(contentsOf: [hPairOne, hPairTwo, hPairThree])
        lowProg.append(contentsOf: [lowOne, lowTwo, lowThree, lowFour, lowFive])
        
        let drawView = view as! drawLineView
        
        drawView.topOp = CGPoint(x: lowOne.frame.origin.x,
                                 y: lowOne.frame.origin.y + (lowOne.frame.height / 2))
        drawView.secOp = CGPoint(x: lowTwo.frame.origin.x,
                                 y: lowTwo.frame.origin.y + (lowTwo.frame.height / 2))
        drawView.thirdOp = CGPoint(x: lowThree.frame.origin.x,
                                   y: lowThree.frame.origin.y + (lowThree.frame.height / 2))
        drawView.fourOp = CGPoint(x: lowFour.frame.origin.x,
                                  y: lowFour.frame.origin.y + (lowFour.frame.height / 2))
        drawView.fiveOp = CGPoint(x: lowFive.frame.origin.x,
                                  y: lowFive.frame.origin.y + (lowFive.frame.height / 2))
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if (stage < 0){
            prompt.text = "Assuming we want at most one low priority program running, how many ways can we choose our set of three?"
            stage += 1
        }
        else if (stage == 0){
            prompt.text = "Lets look at high priority programs first. How many ways could we choose our set of three if we did not want to use any low priority programs?"
            showResponseTools()
        } else if (stage == 1){
            prompt.text = "Now let's consider using one low priority program and two high priority. Whether we choose the low or high priority program(s) first is arbitrary; let's look at high priority first."
            onlyH.isHidden = true
            stage += 1
        } else if (stage == 2){
            prompt.text = "How many possible ways could we create pairs of two from the three possible high priority programs?"
            showResponseTools()
        } else if (stage == 3){
            prompt.text = "Now considering the low priority programs; how many ways could we select one low priority program to complete our set of three?"
            showResponseTools()
        } else if (stage == 4){
            prompt.text = "Each pair of high priority programs can be matched with any low priority program. Therefore, we must multiply the two (3 × 5) to get the total amount of sets that can be made with one low priority program running. Tap the pairs to demonstrate this concept."
            manipButtons(buttonArray: highProg, hide: false)
            stage += 1
        } else if (stage == 5){
            prompt.text = "Thus, there are 16 possible sets of programs that satisfy our condition of running at most one low priority program since we have one way without any low priority programs, and 15 ways if we include one low priority program."
        }
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if (stage == 0){
            if (topAns.text == "3" && botAns.text == "3"){
                prompt.text = "Correct! We have three high priority programs to choose from, and we're choosing a set of three. Above is the one possible configuration."
                onlyH.isHidden = false
                stage += 1
                hideResponseTools()
            } else {
                prompt.text = "Incorrect. How many ways could we choose our set of three programs if we do not want to use any low priority programs."
            }
        } else if (stage == 2){
            if (topAns.text == "3" && botAns.text == "2"){
                prompt.text = "Correct! We have three high priority programs to choose from, and we need two for our set of programs. Above you can see the three possible pairs."
                manipButtons(buttonArray: highProg, hide: true)
                stage += 1
                hideResponseTools()
            } else {
                prompt.text = "Incorrect. How many ways could we select two high priority programs from our set of three?"
            }
        } else if (stage == 3){
            if (topAns.text == "5" && botAns.text == "1"){
                prompt.text = "Correct! We have five low priority programs to choose from, and we only need one more to complete our set of three. Above are the five possible choices."
                showLabels(labelArray: lowProg)
                stage += 1
                hideResponseTools()
            }
        }
    }
    
    @IBAction func pairOnePressed(_ sender: Any) {
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: hPairOne.frame.origin.x + hPairOne.frame.width,
                                        y: hPairOne.frame.origin.y + (hPairOne.frame.height / 2))
        drawView.currentColor = UIColor.orange
        drawView.whichView = 7
        drawView.setNeedsDisplay()
    }
    
    @IBAction func pairTwoPressed(_ sender: Any) {
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: hPairTwo.frame.origin.x + hPairTwo.frame.width,
                                        y: hPairTwo.frame.origin.y + (hPairTwo.frame.height / 2))
        drawView.currentColor = UIColor.orange
        drawView.whichView = 7
        drawView.setNeedsDisplay()
    }
    
    @IBAction func pairThreePressed(_ sender: Any) {
        let drawView = view as! drawLineView
        drawView.buttonOrigin = CGPoint(x: hPairThree.frame.origin.x + hPairThree.frame.width,
                                        y: hPairThree.frame.origin.y + (hPairThree.frame.height / 2))
        drawView.currentColor = UIColor.orange
        drawView.whichView = 7
        drawView.setNeedsDisplay()
    }
    
    func showLabels(labelArray: [UILabel]){
        for label in labelArray{
            label.isHidden = false
        }
    }
    
    func manipButtons(buttonArray: [UIButton], hide: Bool){
        for button in buttonArray{
            if (hide){
            button.isHidden = false
            } else {
                button.isEnabled = true
            }
        }
    }
    
    func showResponseTools(){
        parenthesis.isHidden = false
        topAns.isHidden = false
        botAns.isHidden = false
        subButton.isHidden = false
        nextButton.isEnabled = false
    }
    
    func hideResponseTools(){
        parenthesis.isHidden = true
        topAns.isHidden = true
        botAns.isHidden = true
        topAns.text = ""
        botAns.text = ""
        subButton.isHidden = true
        nextButton.isEnabled = true
    }
    
    @IBAction func reset(_ sender: Any) {
    }
    

}
