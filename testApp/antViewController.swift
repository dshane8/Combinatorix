//
//  antViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 8/15/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class antViewController: UIViewController {

    @IBOutlet weak var aLet: UILabel!
    @IBOutlet weak var nLet: UILabel!
    @IBOutlet weak var tLet: UILabel!
    
    @IBOutlet weak var aBut: UIButton!
    @IBOutlet weak var nBut: UIButton!
    @IBOutlet weak var tBut: UIButton!
    
    @IBOutlet weak var rootLet: UILabel!
    
    @IBOutlet weak var topSec: UILabel!
    @IBOutlet weak var botSec: UILabel!
    
    @IBOutlet weak var topThird: UILabel!
    @IBOutlet weak var botThird: UILabel!
    
    @IBOutlet weak var nextBut: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var ansBut: UIButton!
    
    @IBOutlet weak var compileAns: UILabel!
    
    private var stage = 0
    
    private var colOne: [UILabel] = []
    private var colTwo: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prompt.text = "How many ways can you rearrange the word 'ANT'?"
        
        compileAns.text = ""
        
        colOne.append(contentsOf: [topSec,botSec])
        colTwo.append(contentsOf: [topThird, botThird])
        

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(antViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
            prompt.text = "How many choices do you have for the final letter after the previous two have been chosen?"
            showResponseTools()
        } else {
            prompt.text = "There are 6 ways to rearrange the letters in the word 'ANT'"
            compileAns.text = "3 × 2 × 1 = 6"

        }
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if (stage == 0){
            if (answer.text == "3"){
                prompt.text = "Correct! Choose a letter above then press next."
                hideResponseTools()
                compileAns.text = "3"
            } else {
                prompt.text = "Incorrect. Of the three letters above, how many could come first?"
                
            }
        } else if (stage == 1){
            if (answer.text == "2"){
                prompt.text = "Correct! Choose a letter above then press next."
                hideResponseTools()
                compileAns.text = "3 × 2"
            } else {
                prompt.text = "Incorrect. Of the two remaining letters above, how many could be chosen next?"
            }
        } else if (stage == 2){
            if (answer.text == "1"){
                prompt.text = "Correct! Choose the final letter then press next."
                hideResponseTools()
                compileAns.text = "3 × 2 × 1"
            } else {
                prompt.text = "Incorrect. Of the remaining letters above, how many options do you have for the last letter?"
            }
        }
    }
    
    @IBAction func aPressed(_ sender: Any) {
        aLet.isHidden = true
        aBut.isEnabled = false
        if (stage == 0){
            rootLet.text = aLet.text
            
            topSec.text = nLet.text
            botSec.text = tLet.text
            
            topThird.text = tLet.text
            botThird.text = nLet.text
            
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
        }
    }
    
    @IBAction func nPressed(_ sender: Any) {
        nLet.isHidden = true
        nBut.isEnabled = false
        if (stage == 0){
            rootLet.text = nLet.text
            
            topSec.text = aLet.text
            botSec.text = tLet.text
            
            topThird.text = tLet.text
            botThird.text = aLet.text
            
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
        }
    }
    
    @IBAction func tPressed(_ sender: Any) {
        tLet.isHidden = true
        tBut.isEnabled = false
        if (stage == 0){
            rootLet.text = tLet.text
            
            topSec.text = aLet.text
            botSec.text = nLet.text
            
            topThird.text = nLet.text
            botThird.text = aLet.text
            
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
        ansBut.isHidden = false
        nextBut.isEnabled = false
    }
    
    func hideResponseTools(){
        answer.isHidden = true
        ansBut.isHidden = true
        answer.text = ""
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        aLet.isHidden = false
        nLet.isHidden = false
        tLet.isHidden = false
        
        aBut.isEnabled = true
        nBut.isEnabled = true
        tBut.isEnabled = true
        
        stage = 0
        
        rootLet.isHidden = true
        hideCol(colArray: colOne)
        hideCol(colArray: colTwo)
        
        prompt.text = "How many ways can you rearrange the word 'ANT'?"
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
