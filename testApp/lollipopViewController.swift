//
//  lollipopViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 7/9/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class lollipopViewController: UIViewController {

    
    @IBOutlet weak var oneL: UILabel!
    @IBOutlet weak var oneO: UILabel!
    @IBOutlet weak var twoO: UILabel!
    @IBOutlet weak var oneP: UILabel!
    @IBOutlet weak var twoP: UILabel!
    @IBOutlet weak var oneI: UILabel!
    @IBOutlet weak var twoL: UILabel!
    @IBOutlet weak var threeL: UILabel!
   
    @IBOutlet weak var firstLet: UILabel!
    @IBOutlet weak var secondLet: UILabel!
    @IBOutlet weak var thirdLet: UILabel!
    @IBOutlet weak var fourLet: UILabel!
    @IBOutlet weak var fiveLet: UILabel!
    @IBOutlet weak var sixLet: UILabel!
    @IBOutlet weak var sevenLet: UILabel!
    @IBOutlet weak var eightLet: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var parenthesis: UILabel!
    @IBOutlet weak var topAns: UITextField!
    @IBOutlet weak var botAns: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    private var stage = 0
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prompt.text = "How many ways can you rearrange the letters in 'LOLLIPOP'?"
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        //tap.cancelsTouchesInView = false
        
        //view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(lollipopViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(lollipopViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(lollipopViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object:self.view.window)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object:self.view.window)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func firstSpot(_ sender: Any) {
        if (stage == 0){
            firstButton.isEnabled = false
            if (count == 1){
                firstLet.text = oneL.text
                firstLet.isHidden = false
                oneL.isHidden = true
                count += 1
            } else if (count == 2){
                firstLet.text = twoL.text
                firstLet.isHidden = false
                twoL.isHidden = true
                count += 1
            } else if (count == 3){
                firstLet.text = threeL.text
                firstLet.isHidden = false
                threeL.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 1){
            firstButton.isEnabled = false
            if (count == 1){
                firstLet.text = oneO.text
                firstLet.isHidden = false
                oneO.isHidden = true
                count += 1
            } else if (count == 2){
                firstLet.text = twoO.text
                firstLet.isHidden = false
                twoO.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 2){
            firstButton.isEnabled = false
            if (count == 1){
                firstLet.text = oneP.text
                firstLet.isHidden = false
                oneP.isHidden = true
                count += 1
            } else if (count == 2){
                firstLet.text = twoP.text
                firstLet.isHidden = false
                twoP.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 3){
            firstButton.isEnabled = false
            if (count == 1){
                firstLet.text = oneI.text
                firstLet.isHidden = false
                oneI.isHidden = true
                stage += 1
            }
        }
    }
    
    @IBAction func secondSpot(_ sender: Any) {
        if (stage == 0){
            secondButton.isEnabled = false
            if (count == 1){
                secondLet.text = oneL.text
                secondLet.isHidden = false
                oneL.isHidden = true
                count += 1
            } else if (count == 2){
                secondLet.text = twoL.text
                secondLet.isHidden = false
                twoL.isHidden = true
                count += 1
            } else if (count == 3){
                secondLet.text = threeL.text
                secondLet.isHidden = false
                threeL.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 1){
            secondButton.isEnabled = false
            if (count == 1){
                secondLet.text = oneO.text
                secondLet.isHidden = false
                oneO.isHidden = true
                count += 1
            } else if (count == 2){
                secondLet.text = twoO.text
                secondLet.isHidden = false
                twoO.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 2){
            secondButton.isEnabled = false
            if (count == 1){
                secondLet.text = oneP.text
                secondLet.isHidden = false
                oneP.isHidden = true
                count += 1
            } else if (count == 2){
                secondLet.text = twoP.text
                secondLet.isHidden = false
                twoP.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 3){
            secondButton.isEnabled = false
            if (count == 1){
                secondLet.text = oneI.text
                secondLet.isHidden = false
                oneI.isHidden = true
                stage += 1
            }
        }
    }
    
    @IBAction func thirdSpot(_ sender: Any) {
        if (stage == 0){
            thirdButton.isEnabled = false
            if (count == 1){
                thirdLet.text = oneL.text
                thirdLet.isHidden = false
                oneL.isHidden = true
                count += 1
            } else if (count == 2){
                thirdLet.text = twoL.text
                thirdLet.isHidden = false
                twoL.isHidden = true
                count += 1
            } else if (count == 3){
                thirdLet.text = threeL.text
                thirdLet.isHidden = false
                threeL.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 1){
            thirdButton.isEnabled = false
            if (count == 1){
                thirdLet.text = oneO.text
                thirdLet.isHidden = false
                oneO.isHidden = true
                count += 1
            } else if (count == 2){
                thirdLet.text = twoO.text
                thirdLet.isHidden = false
                twoO.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 2){
            thirdButton.isEnabled = false
            if (count == 1){
                thirdLet.text = oneP.text
                thirdLet.isHidden = false
                oneP.isHidden = true
                count += 1
            } else if (count == 2){
                thirdLet.text = twoP.text
                thirdLet.isHidden = false
                twoP.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 3){
            thirdButton.isEnabled = false
            if (count == 1){
                thirdLet.text = oneI.text
                thirdLet.isHidden = false
                oneI.isHidden = true
                stage += 1
            }
        }
    }
    
    @IBAction func fourthSpot(_ sender: Any) {
        if (stage == 0){
            fourButton.isEnabled = false
            if (count == 1){
                fourLet.text = oneL.text
                fourLet.isHidden = false
                oneL.isHidden = true
                count += 1
            } else if (count == 2){
                fourLet.text = twoL.text
                fourLet.isHidden = false
                twoL.isHidden = true
                count += 1
            } else if (count == 3){
                fourLet.text = threeL.text
                fourLet.isHidden = false
                threeL.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 1){
            fourButton.isEnabled = false
            if (count == 1){
                fourLet.text = oneO.text
                fourLet.isHidden = false
                oneO.isHidden = true
                count += 1
            } else if (count == 2){
                fourLet.text = twoO.text
                fourLet.isHidden = false
                twoO.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 2){
            fourButton.isEnabled = false
            if (count == 1){
                fourLet.text = oneP.text
                fourLet.isHidden = false
                oneP.isHidden = true
                count += 1
            } else if (count == 2){
                fourLet.text = twoP.text
                fourLet.isHidden = false
                twoP.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 3){
            fourButton.isEnabled = false
            if (count == 1){
                fourLet.text = oneI.text
                fourLet.isHidden = false
                oneI.isHidden = true
                stage += 1
            }
        }
    }
    
    @IBAction func fifthSpot(_ sender: Any) {
        if (stage == 0){
            fiveButton.isEnabled = false
            if (count == 1){
                fiveLet.text = oneL.text
                fiveLet.isHidden = false
                oneL.isHidden = true
                count += 1
            } else if (count == 2){
                fiveLet.text = twoL.text
                fiveLet.isHidden = false
                twoL.isHidden = true
                count += 1
            } else if (count == 3){
                fiveLet.text = threeL.text
                fiveLet.isHidden = false
                threeL.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 1){
            fiveButton.isEnabled = false
            if (count == 1){
                fiveLet.text = oneO.text
                fiveLet.isHidden = false
                oneO.isHidden = true
                count += 1
            } else if (count == 2){
                fiveLet.text = twoO.text
                fiveLet.isHidden = false
                twoO.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 2){
            fiveButton.isEnabled = false
            if (count == 1){
                fiveLet.text = oneP.text
                fiveLet.isHidden = false
                oneP.isHidden = true
                count += 1
            } else if (count == 2){
                fiveLet.text = twoP.text
                fiveLet.isHidden = false
                twoP.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 3){
            fiveButton.isEnabled = false
            if (count == 1){
                fiveLet.text = oneI.text
                fiveLet.isHidden = false
                oneI.isHidden = true
                stage += 1
            }
        }
    }
    
    @IBAction func sixthSpot(_ sender: Any) {
        if (stage == 0){
            sixButton.isEnabled = false
            if (count == 1){
                sixLet.text = oneL.text
                sixLet.isHidden = false
                oneL.isHidden = true
                count += 1
            } else if (count == 2){
                sixLet.text = twoL.text
                sixLet.isHidden = false
                twoL.isHidden = true
                count += 1
            } else if (count == 3){
                sixLet.text = threeL.text
                sixLet.isHidden = false
                threeL.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 1){
            sixButton.isEnabled = false
            if (count == 1){
                sixLet.text = oneO.text
                sixLet.isHidden = false
                oneO.isHidden = true
                count += 1
            } else if (count == 2){
                sixLet.text = twoO.text
                sixLet.isHidden = false
                twoO.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 2){
            sixButton.isEnabled = false
            if (count == 1){
                sixLet.text = oneP.text
                sixLet.isHidden = false
                oneP.isHidden = true
                count += 1
            } else if (count == 2){
                sixLet.text = twoP.text
                sixLet.isHidden = false
                twoP.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 3){
            sixButton.isEnabled = false
            if (count == 1){
                sixLet.text = oneI.text
                sixLet.isHidden = false
                oneI.isHidden = true
                stage += 1
            }
        }
    }
    
    @IBAction func seventhSpot(_ sender: Any) {
        if (stage == 0){
            sevenButton.isEnabled = false
            if (count == 1){
                sevenLet.text = oneL.text
                sevenLet.isHidden = false
                oneL.isHidden = true
                count += 1
            } else if (count == 2){
                sevenLet.text = twoL.text
                sevenLet.isHidden = false
                twoL.isHidden = true
                count += 1
            } else if (count == 3){
                sevenLet.text = threeL.text
                sevenLet.isHidden = false
                threeL.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 1){
            sevenButton.isEnabled = false
            if (count == 1){
                sevenLet.text = oneO.text
                sevenLet.isHidden = false
                oneO.isHidden = true
                count += 1
            } else if (count == 2){
                sevenLet.text = twoO.text
                sevenLet.isHidden = false
                twoO.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 2){
            sevenButton.isEnabled = false
            if (count == 1){
                sevenLet.text = oneP.text
                sevenLet.isHidden = false
                oneP.isHidden = true
                count += 1
            } else if (count == 2){
                sevenLet.text = twoP.text
                sevenLet.isHidden = false
                twoP.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 3){
            sevenLet.isEnabled = false
            if (count == 1){
                sevenLet.text = oneI.text
                sevenLet.isHidden = false
                oneI.isHidden = true
                stage += 1
            }
        }
    }
    
    @IBAction func eigthSpot(_ sender: Any) {
        if (stage == 0){
            eightButton.isEnabled = false
            if (count == 1){
                eightLet.text = oneL.text
                eightLet.isHidden = false
                oneL.isHidden = true
                count += 1
            } else if (count == 2){
                eightLet.text = twoL.text
                eightLet.isHidden = false
                twoL.isHidden = true
                count += 1
            } else if (count == 3){
                eightLet.text = threeL.text
                eightLet.isHidden = false
                threeL.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 1){
            eightButton.isEnabled = false
            if (count == 1){
                eightLet.text = oneO.text
                eightLet.isHidden = false
                oneO.isHidden = true
                count += 1
            } else if (count == 2){
                eightLet.text = twoO.text
                eightLet.isHidden = false
                twoO.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 2){
            eightButton.isEnabled = false
            if (count == 1){
                eightLet.text = oneP.text
                eightLet.isHidden = false
                oneP.isHidden = true
                count += 1
            } else if (count == 2){
                eightLet.text = twoP.text
                eightLet.isHidden = false
                twoP.isHidden = true
                disableButtons()
                stage += 1
            }
        } else if (stage == 3){
            eightButton.isEnabled = false
            if (count == 1){
                eightLet.text = oneI.text
                eightLet.isHidden = false
                oneI.isHidden = true
                stage += 1
            }
        }
    }
    
    @IBAction func nextPrompt(_ sender: Any) {
        if (stage == 0){
            prompt.text = "How many ways can you place the letter 'L'?"
            showResponse()
        } else if (stage == 1){
            count = 0
            prompt.text = "How many ways can you place the letter 'O' now that you've placed every 'L'?"
            showResponse()
        } else if (stage == 2){
            count = 0
            prompt.text = "How many ways can you place the letter 'P' now that you've placed every 'L' and 'O'?"
            showResponse()
        } else if (stage == 3){
            count = 0
            prompt.text = "How many ways can you place the letter 'I' since every other letter was placed?"
            showResponse()
        } else {
            prompt.text = "C(8,3) * C(5,2) * C(3,2) * C(1,1) = 1,680"
        }
    }
    
    @IBAction func checkSub(_ sender: Any) {
        if (stage == 0){
            if (topAns.text == "8" && botAns.text == "3"){
                prompt.text = "Correct. Place all three L's by tapping above the space you'd like to place them then tap next."
                hideResponse()
                enableButtons()
                count += 1
            } else {
                prompt.text = "Incorrect. Try again. How many spaces are there to place an 'L' and how many L's do you have to place?"
            }
            topAns.text = ""
            botAns.text = ""
        } else if (stage == 1){
            if (topAns.text == "5" && botAns.text == "2"){
                prompt.text = "Correct. Place both O's by tapping above the space you'd like to place them then tap next."
                hideResponse()
                enableButtons()
                count += 1
            } else {
                prompt.text = "Incorrect. Try again. How many open spaces are there to place an 'O' and how many O's do you have to place?"
            }
            topAns.text = ""
            botAns.text = ""
        } else if (stage == 2){
            if (topAns.text == "3" && botAns.text == "2"){
                prompt.text = "Correct. Place both P's by tapping above the space you'd like to place them then tap next."
                hideResponse()
                enableButtons()
                count += 1
            } else {
                prompt.text = "Incorrect. Try again. How many open spaces are there to place an 'O' and how many P's do you have to place?"
            }
            topAns.text = ""
            botAns.text = ""
        } else if (stage == 3){
            if (topAns.text == "1" && botAns.text == "1"){
                prompt.text = "Correct. Place the final letter by tapping above the space you'd like to place it in then tap next."
                hideResponse()
                enableButtons()
                count += 1
            } else {
                prompt.text = "Incorrect. Try again. How many open spaces are there to place an 'I' and how many I's do you have to place?"
            }
            topAns.text = ""
            botAns.text = ""
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        oneL.isHidden = false
        oneO.isHidden = false
        twoL.isHidden = false
        threeL.isHidden = false
        oneI.isHidden = false
        oneP.isHidden = false
        twoO.isHidden = false
        twoP.isHidden = false
        
        firstLet.isHidden = true
        secondLet.isHidden = true
        thirdLet.isHidden = true
        fourLet.isHidden = true
        fiveLet.isHidden = true
        sixLet.isHidden = true
        sevenLet.isHidden = true
        eightLet.isHidden = true
        
        topAns.isHidden = true
        botAns.isHidden = true
        parenthesis.isHidden = true
        submitButton.isHidden = true
        
        disableButtons()
        
        prompt.text = "How many ways can you rearrange the letters in 'LOLLIPOP'?"
        
        topAns.text = ""
        botAns.text = ""
        stage = 0
        count = 0
    }
    
    func enableButtons(){
        firstButton.isEnabled = true
        secondButton.isEnabled = true
        thirdButton.isEnabled = true
        fourButton.isEnabled = true
        fiveButton.isEnabled = true
        sixButton.isEnabled = true
        sevenButton.isEnabled = true
        eightButton.isEnabled = true
    }
    
    func disableButtons(){
        firstButton.isEnabled = false
        secondButton.isEnabled = false
        thirdButton.isEnabled = false
        fourButton.isEnabled = false
        fiveButton.isEnabled = false
        sixButton.isEnabled = false
        sevenButton.isEnabled = false
        eightButton.isEnabled = false
    }
    
    func showResponse(){
        parenthesis.isHidden = false
        topAns.isHidden = false
        botAns.isHidden = false
        submitButton.isHidden = false
    }
    
    func hideResponse(){
        parenthesis.isHidden = true
        topAns.isHidden = true
        botAns.isHidden = true
        submitButton.isHidden = true
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
