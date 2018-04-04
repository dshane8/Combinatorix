//
//  emojiViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 7/9/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class emojiViewController: UIViewController {
    
    @IBOutlet weak var emojiGroup: UILabel!
    
    @IBOutlet weak var pairOne: UILabel!
    @IBOutlet weak var pairTwo: UILabel!
    @IBOutlet weak var pairThree: UILabel!
    @IBOutlet weak var pairFour: UILabel!
    @IBOutlet weak var pairFive: UILabel!
    @IBOutlet weak var pairSix: UILabel!
    @IBOutlet weak var pairSeven: UILabel!
    @IBOutlet weak var pairEight: UILabel!
    @IBOutlet weak var pairNine: UILabel!
    @IBOutlet weak var pairTen: UILabel!
    
    @IBOutlet weak var pairOneB: UIButton!
    @IBOutlet weak var pairTwoB: UIButton!
    @IBOutlet weak var pairThreeB: UIButton!
    @IBOutlet weak var pairFourB: UIButton!
    @IBOutlet weak var pairFiveB: UIButton!
    @IBOutlet weak var pairSixB: UIButton!
    @IBOutlet weak var pairSevenB: UIButton!
    @IBOutlet weak var pairEightB: UIButton!
    @IBOutlet weak var pairNineB: UIButton!
    @IBOutlet weak var pairTenB: UIButton!
    
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var parenthesis: UILabel!
    @IBOutlet weak var topAns: UITextField!
    @IBOutlet weak var botAns: UITextField!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var nextBut: UIButton!
    
    private var stage = 0
    private var count = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         prompt.text = "How many committes of 2 can be made using the people above if each committe must have at least one girl?"
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        //tap.cancelsTouchesInView = false
        
        //view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if (stage == 0) {
            prompt.text = "What is the total number of possible committe combinations?"
            topAns.isHidden = false
            botAns.isHidden = false
            parenthesis.isHidden = false
            subButton.isHidden = false
            nextBut.isEnabled = false
        } else if (stage == 1) {
            prompt.text = "Remove committees that do not contain a girl by tapping on them. Tap submit when done."
            subButton.isHidden = false
            
            pairOneB.isEnabled = true
            pairTwoB.isEnabled = true
            pairThreeB.isEnabled = true
            pairFourB.isEnabled = true
            pairFiveB.isEnabled = true
            pairSixB.isEnabled = true
            pairSevenB.isEnabled = true
            pairEightB.isEnabled = true
            pairNineB.isEnabled = true
            pairTenB.isEnabled = true
        }
    }
    
    @IBAction func checkAns(_ sender: Any) {
        if (stage == 0){
            if (topAns.text == "5" && botAns.text == "2"){
                prompt.text = "Correct. Above you will see all 10 possible combinations. Press next."
                topAns.isHidden = true
                botAns.isHidden = true
                parenthesis.isHidden = true
                subButton.isHidden = true
                nextBut.isEnabled = true
                
                pairOne.isHidden = false
                pairTwo.isHidden = false
                pairThree.isHidden = false
                pairFour.isHidden = false
                pairFive.isHidden = false
                pairSix.isHidden = false
                pairSeven.isHidden = false
                pairEight.isHidden = false
                pairNine.isHidden = false
                pairTen.isHidden = false
                
                stage += 1
            } else {
                prompt.text = "Incorrect. Try again. Of the 5 people, how many committes of 2 can be made?"
            }
        } else if (stage == 1){
            if (count == 3 && pairOne.isHidden && pairTwo.isHidden && pairThree.isHidden){
                prompt.text = "Correct! Above are the seven possible committee configurations containing at least one girl."
                nextBut.isEnabled = false
                subButton.isHidden = true
            } else {
                prompt.text = "Incorrect. Try again. You can make pairs reappear by tapping on where they were."
            }
        }
    }
    
    @IBAction func tapOne(_ sender: Any) {
        if (pairOne.isHidden){
            pairOne.isHidden = false
            count  -= 1
        } else {
            pairOne.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapTwo(_ sender: Any) {
        if (pairTwo.isHidden){
            pairTwo.isHidden = false
            count  -= 1
        } else {
            pairTwo.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapThree(_ sender: Any) {
        if (pairThree.isHidden){
            pairThree.isHidden = false
            count  -= 1
        } else {
            pairThree.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapFour(_ sender: Any) {
        if (pairFour.isHidden){
            pairFour.isHidden = false
            count  -= 1
        } else {
            pairFour.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapFive(_ sender: Any) {
        if (pairFive.isHidden){
            pairFive.isHidden = false
            count  -= 1
        } else {
            pairFive.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapSix(_ sender: Any) {
        if (pairSix.isHidden){
            pairSix.isHidden = false
            count  -= 1
        } else {
            pairSix.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapSeven(_ sender: Any) {
        if (pairSeven.isHidden){
            pairSeven.isHidden = false
            count  -= 1
        } else {
            pairSeven.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapEight(_ sender: Any) {
        if (pairEight.isHidden){
            pairEight.isHidden = false
            count  -= 1
        } else {
            pairEight.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapNine(_ sender: Any) {
        if (pairNine.isHidden){
            pairNine.isHidden = false
            count  -= 1
        } else {
            pairNine.isHidden = true
            count += 1
        }
    }
    
    @IBAction func tapTen(_ sender: Any) {
        if (pairTen.isHidden){
            pairTen.isHidden = false
            count  -= 1
        } else {
            pairTen.isHidden = true
            count += 1
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        pairOne.isHidden = true
        pairTwo.isHidden = true
        pairThree.isHidden = true
        pairFour.isHidden = true
        pairFive.isHidden = true
        pairSix.isHidden = true
        pairSeven.isHidden = true
        pairEight.isHidden = true
        pairNine.isHidden = true
        pairTen.isHidden = true
        
        pairOneB.isEnabled = false
        pairTwoB.isEnabled = false
        pairThreeB.isEnabled = false
        pairFourB.isEnabled = false
        pairFiveB.isEnabled = false
        pairSixB.isEnabled = false
        pairSevenB.isEnabled = false
        pairEightB.isEnabled = false
        pairNineB.isEnabled = false
        pairTenB.isEnabled = false
        
        topAns.text = ""
        topAns.isHidden = true
        botAns.text = ""
        botAns.isHidden = true
        parenthesis.isHidden = true
        subButton.isHidden = true
        
        count = 0
        stage = 0
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
