//
//  dogsViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 7/30/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class dogsViewController: UIViewController {

    @IBOutlet weak var dLet: UILabel!
    @IBOutlet weak var oLet: UILabel!
    @IBOutlet weak var gLet: UILabel!
    @IBOutlet weak var sLet: UILabel!
    
    @IBOutlet weak var dBut: UIButton!
    @IBOutlet weak var oBut: UIButton!
    @IBOutlet weak var gBut: UIButton!
    @IBOutlet weak var sBut: UIButton!
    
    @IBOutlet weak var rootLet: UILabel!
    @IBOutlet weak var firstOne: UILabel!
    @IBOutlet weak var secondOne: UILabel!
    @IBOutlet weak var thirdOne: UILabel!
    
    @IBOutlet weak var firstTwo: UILabel!
    @IBOutlet weak var secondTwo: UILabel!
    @IBOutlet weak var thirdTwo: UILabel!
    @IBOutlet weak var fourTwo: UILabel!
    @IBOutlet weak var fiveTwo: UILabel!
    @IBOutlet weak var sixTwo: UILabel!
    
    @IBOutlet weak var firstThree: UILabel!
    @IBOutlet weak var secondThree: UILabel!
    @IBOutlet weak var thirdThree: UILabel!
    @IBOutlet weak var fourThree: UILabel!
    @IBOutlet weak var fiveThree: UILabel!
    @IBOutlet weak var sixThree: UILabel!
    
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var subBut: UIButton!
    @IBOutlet weak var nextBut: UIButton!
    
    @IBOutlet weak var compileAns: UILabel!
    
    private var colOne: [UILabel] = []
    private var colTwo: [UILabel] = []
    private var colThree: [UILabel] = []
    
    private var stage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prompt.text = "How many ways can you rearrange the word 'DOGS'?"
        colOne.append(contentsOf: [firstOne, secondOne, thirdOne])
        colTwo.append(contentsOf: [firstTwo, secondTwo, thirdTwo, fourTwo, fiveTwo, sixTwo])
        colThree.append(contentsOf: [firstThree, secondThree, thirdThree,
                                     fourThree, fiveThree, sixThree])
        
        compileAns.text = ""
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
       // tap.cancelsTouchesInView = false
        
        // view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if (stage == 0){
            prompt.text = "How many choices do you have for which letter comes first?"
            showResponseTools()
        } else if (stage == 1){
            prompt.text = "How many choices do you have for the second letter after the first has already been chosen?"
            showResponseTools()
        } else if (stage == 2){
            prompt.text = "How many choices do you have for the third letter after the previous two have been chosen?"
            showResponseTools()
        } else if (stage == 3){
            prompt.text = "How many choices do you have for the final letter after the all other letters have been used?"
            showResponseTools()
        } else if (stage == 4){
            prompt.text = "There are 24 ways to rearrange the letters in the word 'DOGS'"
            compileAns.text = "4 × 3 × 2 × 1 = 24"
        }
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if (stage == 0){
            if (answer.text == "4"){
                prompt.text = "Correct! Choose a letter above then press next."
                hideResponseTools()
                compileAns.text = "4"
            } else {
                prompt.text = "Incorrect. Of the four letters above, how many could come first?"
            }
        } else if (stage == 1){
            if (answer.text == "3"){
                prompt.text = "Correct! Choose a letter above then press next."
                hideResponseTools()
                compileAns.text = "4 × 3"
            } else {
                prompt.text = "Incorrect. Of the remaining letters above, how many could be chosen second?"
            }
        } else if (stage == 2){
            if (answer.text == "2"){
                prompt.text = "Correct! Choose a letter above then press next."
                hideResponseTools()
                compileAns.text = "4 × 3 × 2"
            } else {
                prompt.text = "Incorrect. Of the remaining letters above, how many are left to potentially be the third letter?"
            }
        } else if (stage == 3){
            if (answer.text == "1"){
                prompt.text = "Correct! Choose the final letter then press next."
                hideResponseTools()
                compileAns.text = "4 × 3 × 2 × 1"
            } else {
                prompt.text = "Incorrect. Of the remaining letters above, how many are left to be the last letter?"
            }
        }
    }
    
    @IBAction func dButPressed(_ sender: Any) {
        dLet.isHidden = true
        dBut.isEnabled = false
        if (stage == 0){
            rootLet.text = dLet.text
            
            firstOne.text = oLet.text
            secondOne.text = gLet.text
            thirdOne.text = sLet.text
            
            firstTwo.text = gLet.text
            secondTwo.text = sLet.text
            thirdTwo.text = oLet.text
            fourTwo.text = sLet.text
            fiveTwo.text = oLet.text
            sixTwo.text = gLet.text
            
            firstThree.text = sLet.text
            secondThree.text = gLet.text
            thirdThree.text = sLet.text
            fourThree.text = oLet.text
            fiveThree.text = gLet.text
            sixThree.text = oLet.text
            
            rootLet.isHidden = false
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 1){
            showCol(colArray: colOne)
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 2){
            showCol(colArray: colTwo)
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 3){
            showCol(colArray: colThree)
            nextBut.isEnabled = true
            stage += 1
        }
    }
    
    @IBAction func oButPressed(_ sender: Any) {
        oLet.isHidden = true
        oBut.isEnabled = false
        if (stage == 0){
            rootLet.text = oLet.text
            
            firstOne.text = dLet.text
            secondOne.text = gLet.text
            thirdOne.text = sLet.text
            
            firstTwo.text = gLet.text
            secondTwo.text = sLet.text
            thirdTwo.text = dLet.text
            fourTwo.text = sLet.text
            fiveTwo.text = dLet.text
            sixTwo.text = gLet.text
            
            firstThree.text = sLet.text
            secondThree.text = gLet.text
            thirdThree.text = sLet.text
            fourThree.text = dLet.text
            fiveThree.text = gLet.text
            sixThree.text = dLet.text
            
            rootLet.isHidden = false
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 1){
            showCol(colArray: colOne)
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 2){
            showCol(colArray: colTwo)
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 3){
            showCol(colArray: colThree)
            nextBut.isEnabled = true
            stage += 1
        }
    }
    
    @IBAction func gButPressed(_ sender: Any) {
        gLet.isHidden = true
        gBut.isEnabled = false
        if (stage == 0){
            rootLet.text = gLet.text
            
            firstOne.text = oLet.text
            secondOne.text = dLet.text
            thirdOne.text = sLet.text
            
            firstTwo.text = dLet.text
            secondTwo.text = sLet.text
            thirdTwo.text = oLet.text
            fourTwo.text = sLet.text
            fiveTwo.text = oLet.text
            sixTwo.text = dLet.text
            
            firstThree.text = sLet.text
            secondThree.text = dLet.text
            thirdThree.text = sLet.text
            fourThree.text = oLet.text
            fiveThree.text = dLet.text
            sixThree.text = oLet.text
            
            rootLet.isHidden = false
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 1){
            showCol(colArray: colOne)
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 2){
            showCol(colArray: colTwo)
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 3){
            showCol(colArray: colThree)
            nextBut.isEnabled = true
            stage += 1
        }
    }
    
    @IBAction func sButPressed(_ sender: Any) {
        sLet.isHidden = true
        sBut.isEnabled = false
        if (stage == 0){
            rootLet.text = sLet.text
            
            firstOne.text = oLet.text
            secondOne.text = gLet.text
            thirdOne.text = dLet.text
            
            firstTwo.text = gLet.text
            secondTwo.text = dLet.text
            thirdTwo.text = oLet.text
            fourTwo.text = dLet.text
            fiveTwo.text = oLet.text
            sixTwo.text = gLet.text
            
            firstThree.text = dLet.text
            secondThree.text = gLet.text
            thirdThree.text = dLet.text
            fourThree.text = oLet.text
            fiveThree.text = gLet.text
            sixThree.text = oLet.text
            
            rootLet.isHidden = false
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 1){
            showCol(colArray: colOne)
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 2){
            showCol(colArray: colTwo)
            nextBut.isEnabled = true
            stage += 1
        } else if (stage == 3){
            showCol(colArray: colThree)
            nextBut.isEnabled = true
            stage += 1
        }
    }
    
    func showCol(colArray: [UILabel]){
        for lab in colArray{
            lab.isHidden = false
        }
    }
    
    func hideCol(colArray: [UILabel]){
        for lab in colArray{
            lab.isHidden = true
        }
    }
    
    func showResponseTools(){
        answer.isHidden = false
        subBut.isHidden = false
        nextBut.isEnabled = false
    }
    
    func hideResponseTools(){
        answer.isHidden = true
        subBut.isHidden = true
        answer.text = ""
    }
    
    @IBAction func reset(_ sender: Any) {
        dLet.isHidden = false
        oLet.isHidden = false
        gLet.isHidden = false
        sLet.isHidden = false
        
        dBut.isEnabled = true
        oBut.isEnabled = true
        gBut.isEnabled = true
        sBut.isEnabled = true
        
        stage = 0
        
        hideCol(colArray: colOne)
        hideCol(colArray: colTwo)
        hideCol(colArray: colThree)
        
        prompt.text = "How many ways can you rearrange the word 'DOGS'?"
        
        compileAns.text = ""
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
