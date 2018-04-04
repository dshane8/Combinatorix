//
//  telephoneViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 8/6/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class telephoneViewController: UIViewController {

    @IBOutlet weak var sampDigits: UILabel!
    
    @IBOutlet weak var digOne: UITextField!
    @IBOutlet weak var digTwo: UITextField!
    @IBOutlet weak var digThree: UITextField!
    @IBOutlet weak var digFour: UITextField!
    @IBOutlet weak var digFive: UITextField!
    @IBOutlet weak var digSix: UITextField!
    @IBOutlet weak var digSeven: UITextField!
    
    @IBOutlet weak var nextBut: UIButton!
    @IBOutlet weak var subBut: UIButton!
    
    @IBOutlet weak var prompt: UILabel!
    
    private var digits: [UITextField] = []
    
    private var stage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prompt.text = "How many seven digit long telephone numbers would have at least one repeated digit?"
        digits.append(contentsOf: [digOne, digTwo, digThree, digFour, digFive, digSix, digSeven])
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        //tap.cancelsTouchesInView = false
        
        //view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if (stage == 0){
            prompt.text = "To solve this, we must break the problem down. Let's start with figuring out how many total telephone numbers are possible."
            stage += 1
        } else if (stage == 1){
            prompt.text = "How many numbers could be in each telephone digit if there were no restrictions?"
            showResponseTools()
            stage += 1
        } else if (stage == 2){
            prompt.text = "Great! Now that we know there are 10,000,000 let's figure out how many telephone numbers could be made if you can not use a number more than once."
            stage += 1
        } else if (stage == 3){
            prompt.text = "How many numbers could be in each telephone digit if you could not use a number more than once?"
            showResponseTools()
            stage += 1
        } else if (stage == 4){
            prompt.text = "Thus, to solve our initial problem we must subtract the total number of possible telephone numbers by the total number of possible telephone numbers without repeating digits."
            stage += 1
        } else if (stage == 5){
            prompt.text = "10,000,000 - 604,800 = 9,935,200. \nTherefore, the number of possible telephone numbers with at least one repeating digit is 9,395,200."
        }
    }

    @IBAction func subPressed(_ sender: Any) {
        if (stage == 2){
            if (digOne.text == "10" && digTwo.text == "10" && digThree.text == "10" &&
                digFour.text == "10" && digFive.text == "10" && digSix.text == "10" && digSeven.text == "10"){
                prompt.text = "Correct! Each digit could be any number from 0-9 since there are no restrictions. Therefore, there are 10^7 possible phone numbers. Press next."
                hideResponseTools()
            } else {
                prompt.text = "Incorrect. How many numbers could be in each telephone digit if there were no restrictions on the telephone number?"
            }
        } else if (stage == 4){
            if (digOne.text == "10" && digTwo.text == "9" && digThree.text == "8" &&
                digFour.text == "7" && digFive.text == "6" && digSix.text == "5" && digSeven.text == "4"){
                prompt.text = "Correct Therefore, there are \n 10 × 9 × 8 × 7 × 6 × 5 × 4  (10! / 3!)\n  possible phone numbers. Press next."
                hideResponseTools()
            } else {
                prompt.text = "Incorrect. How many numbers could be in each telephone digit if you couldnt use a number more than once?"
            }
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
    
    func showResponseTools(){
        nextBut.isEnabled = false
        for digit in digits{
            digit.isEnabled = true
        }
        subBut.isHidden = false
    }
    
    func hideResponseTools(){
        nextBut.isEnabled = true
        for digit in digits{
            digit.isEnabled = false
        }
        subBut.isHidden = true
    }

    @IBAction func reset(_ sender: Any) {
    }
}
