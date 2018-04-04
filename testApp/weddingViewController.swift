//
//  weddingViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 7/31/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class weddingViewController: UIViewController {

    @IBOutlet weak var groom: UILabel!
    @IBOutlet weak var guestOne: UILabel!
    @IBOutlet weak var guestTwo: UILabel!
    @IBOutlet weak var bride: UILabel!
    @IBOutlet weak var guestThree: UILabel!
    
    @IBOutlet weak var bGroom: UIButton!
    @IBOutlet weak var bGuestOne: UIButton!
    @IBOutlet weak var bGuestTwo: UIButton!
    @IBOutlet weak var bBride: UIButton!
    @IBOutlet weak var bGuestThree: UIButton!
    
    @IBOutlet weak var firstP: UILabel!
    @IBOutlet weak var secondP: UILabel!
    @IBOutlet weak var thirdP: UILabel!
    @IBOutlet weak var fourP: UILabel!
    @IBOutlet weak var fiveP: UILabel!
    
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var nextBut: UIButton!
    @IBOutlet weak var response: UITextField!
    @IBOutlet weak var compileAns: UILabel!
    
    private var guestLabArray: [UILabel] = []
    private var guestButArray: [UIButton] = []
    private var seatsArray: [UILabel] = []
    
    private var stage = 0
    private var secondStage = false
    private var leftPosition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prompt.text = "A groom, bride, and three friends would like to sit at a table together. How many different seating arrangements are possible?"
        guestLabArray.append(contentsOf: [groom, guestOne, guestTwo, bride, guestThree])
        guestButArray.append(contentsOf: [bGroom, bGuestOne, bGuestTwo, bBride, bGuestThree])
        seatsArray.append(contentsOf: [firstP, secondP, thirdP, fourP, fiveP])
        
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordThreeViewController.dismissKeyboard))
        
        //tap.cancelsTouchesInView = false
        
       // view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if (!secondStage){
            if (stage == 0){
                prompt.text = "How many people are available to be chosen for the first seat?"
                showResponseTools()
            } else if (stage == 1){
                prompt.text = "After choosing the first seat, how many people are left to be chosen for the second seat?"
                showResponseTools()
            } else if (stage == 2){
                prompt.text = "After choosing the first two seats, how many people are left to be chosen for the third seat?"
                showResponseTools()
            } else if (stage == 3){
                prompt.text = "After choosing the first three seats, how many people are left to be chosen for the fourth seat?"
                showResponseTools()
            } else if (stage == 4){
                prompt.text = "Now that the first four seats have been chosen, how many people are left to be chosen for the final seat?"
                showResponseTools()
            } else if (stage == 5){
                prompt.text = "5 × 4 × 3 × 2 × 1 = 120. \nThere are 120 ways the party of 5 could sit together. However, what if the bride & groom wanted to sit next to eachother?"
                secondStage = true
                stage = 0
                setSecondStage()
            }
        } else {
            if (stage == 0){
                prompt.text = "Would you like the bride to be at the right or left of the groom?"
                showResponseTools()
            } else if (stage == 1){
                prompt.text = "How many choices do you have for who sits in the first seat?"
                showResponseTools()
            } else if (stage == 2){
                prompt.text = "How many choices do you left for who sits in the second seat?"
                showResponseTools()
            } else if (stage == 3){
                prompt.text = "How many choices do you left for who sits in the third seat?"
                showResponseTools()
            } else if (stage == 4){
                prompt.text = "How many choices do you left for who sits in the fourth seat?"
                showResponseTools()
            } else if (stage == 5){
                prompt.text = "How many choices do you left for who sits in the last seat?"
                showResponseTools()
            } else if (stage == 6 && leftPosition){
                compileAns.isHidden = true
                prompt.text = "4 × 3 × 2 × 1 = 24. \nThere are 24 ways to configure this party of five while keeping the bride on the left. Press next."
                stage += 1
            } else if (stage == 6 && !leftPosition){
                compileAns.isHidden = true
                prompt.text = "4 × 3 × 2 × 1 = 24. \nThere are 24 ways to configure this party of five while keeping the bride on the right. Press next."
                stage += 1
            } else if (stage == 7 && !leftPosition){
                prompt.text = " However, we must also account for the bride on the left. Therefore, there are 48 (24 × 2) ways to sit this party of five while keeping the bride and groom together."
            } else if (stage == 7 && leftPosition){
                prompt.text = " However, we must also account for the bride on the right. Therefore, there are 48 (24 × 2) ways to sit this party of five while keeping the bride and groom together."
            }
        }
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if (!secondStage){
            if (stage == 0){
                if (response.text == "5"){
                    prompt.text = "Correct! Choose who will occupy the first seat then press next."
                    enableButtons()
                    compileAns.text = "5"
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the people above, how many could potentially sit in the first seat?"
                }
            } else if (stage == 1){
                if (response.text == "4"){
                    prompt.text = "Correct! Choose who will occupy the second seat then press next."
                    compileAns.text = "5 × 4"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the remaining people above, how many could potentially sit in the second seat?"
                }
            } else if (stage == 2){
                if (response.text == "3"){
                    prompt.text = "Correct! Choose who will occupy the third seat then press next."
                    compileAns.text = "5 × 4 × 3"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the remaining people above, how many could potentially sit in the third seat?"
                }
            } else if (stage == 3){
                if (response.text == "2"){
                    prompt.text = "Correct! Choose who will occupy the fourth seat then press next."
                    compileAns.text = "5 × 4 × 3 × 2"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the remaining people above, how many could potentially sit in the fourth seat?"
                }
            } else if (stage == 4){
                if (response.text == "1"){
                    prompt.text = "Correct! Choose who will occupy the last seat then press next."
                    compileAns.text = "5 × 4 × 3 × 2 × 1"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the remaining people above, how many could potentially sit in the final seat?"
                }
            }
        } else {
            if (stage == 0){
                if (response.text == "left" || response.text == "Left"){
                    leftPosition = true
                    hideResponseTools()
                    prompt.text = "Okay. The bride will be placed to the left of the groom. Press next."
                    bGroom.isEnabled = false
                    stage += 1
                } else if (response.text == "right" || response.text == "Right"){
                    leftPosition = false
                    hideResponseTools()
                    prompt.text = "Okay. The bride will be placed to the right of the groom. Press next."
                    bBride.isEnabled = false
                    stage += 1
                } else {
                    prompt.text = "Would you like the bride to sit on the right or left of the groom? Please enter either right or left."
                }
            } else if (stage == 1){
                if (response.text == "4"){
                    prompt.text = "Correct! Choose who will occupy the first seat then press next."
                    compileAns.text = "4"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the people above, how many people's seats must be chosen? Keep in mind the bride's position has already been determined."
                }
            } else if (stage == 2){
                if (response.text == "3"){
                    prompt.text = "Correct! Choose who will occupy the second seat then press next"
                    compileAns.text = "4 × 3"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the people above, how many people's seats still must be chosen? Keep in mind the bride's position has already been determined."
                }
            } else if (stage == 3 && !groom.isHidden){
                if (response.text == "2"){
                    prompt.text = "Correct! Choose who will occupy the third seat then press next"
                    compileAns.text = "4 × 3 × 2"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the people above, how many people's seats still must be chosen? Keep in mind the bride's position has already been determined."
                }
            } else if (stage == 3 && groom.isHidden){
                if (response.text == "3"){
                    prompt.text = "Correct! Choose who will occupy the third seat then press next"
                    compileAns.text = "4 × 3 × 2"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the people above, how many people's seats still must be chosen? Keep in mind the bride's position has already been determined."
                }
            } else if (stage == 4 && !groom.isHidden){
                if (response.text == "1"){
                    prompt.text = "Correct! Choose who will occupy the fourth seat then press next"
                    compileAns.text = "4 × 3 × 2 × 1"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the people above, how many people's seats still must be chosen? Keep in mind the bride's position has already been determined."
                }
            }else if (stage == 4 && groom.isHidden){
                if (response.text == "2"){
                    prompt.text = "Correct! Choose who will occupy the fourth seat then press next"
                    compileAns.text = "4 × 3 × 2 × 1"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the people above, how many people's seats still must be chosen? Keep in mind the bride's position has already been determined."
                }
            } else if (stage == 5){
                if (response.text == "1"){
                    prompt.text = "Correct! Choose who will occupy the final seat then press next"
                    compileAns.text = "4 × 3 × 2 × 1"
                    enableButtons()
                    hideResponseTools()
                } else {
                    prompt.text = "Incorrect. From the people above, how many people's seats still must be chosen? Keep in mind the bride's position has already been determined."
                }
            }
        }
    }
    
    @IBAction func groomPressed(_ sender: Any) {
        disableButtons()
        if (!secondStage){
            groom.isHidden = true
            bGroom.isEnabled = false
            if (stage == 0){
                firstP.text = groom.text
                firstP.isHidden = false
                stage += 1
            } else if (stage == 1){
                secondP.text = groom.text
                secondP.isHidden = false
                stage += 1
            } else if (stage == 2){
                thirdP.text = groom.text
                thirdP.isHidden = false
                stage += 1
            } else if (stage == 3){
                fourP.text = groom.text
                fourP.isHidden = false
                stage += 1
            } else if (stage == 4){
                fiveP.text = groom.text
                fiveP.isHidden = false
                stage += 1
            }
        } else {
            if (!leftPosition){
                groom.isHidden = true
                bGroom.isEnabled = false
                bride.isHidden = true
                bBride.isEnabled = false
                if (stage == 1){
                    secondP.text = bride.text
                    firstP.text = groom.text
                    secondP.isHidden = false
                    firstP.isHidden = false
                    stage += 2
                } else if (stage == 2){
                    thirdP.text = bride.text
                    secondP.text = groom.text
                    thirdP.isHidden = false
                    secondP.isHidden = false
                    stage += 2
                } else if (stage == 3){
                    fourP.text = bride.text
                    thirdP.text = groom.text
                    fourP.isHidden = false
                    thirdP.isHidden = false
                    stage += 2
                } else if (stage == 4){
                    fiveP.text = bride.text
                    fourP.text = groom.text
                    fiveP.isHidden = false
                    fourP.isHidden = false
                    stage += 2
                }
            }
        }
    }
    
    @IBAction func guestOnePressed(_ sender: Any) {
        disableButtons()
        guestOne.isHidden = true
        bGuestOne.isEnabled = false
        if (!secondStage){
            if (stage == 0){
                firstP.text = guestOne.text
                firstP.isHidden = false
                stage += 1
            } else if (stage == 1){
                secondP.text = guestOne.text
                secondP.isHidden = false
                stage += 1
            } else if (stage == 2){
                thirdP.text = guestOne.text
                thirdP.isHidden = false
                stage += 1
            } else if (stage == 3){
                fourP.text = guestOne.text
                fourP.isHidden = false
                stage += 1
            } else if (stage == 4){
                fiveP.text = guestOne.text
                fiveP.isHidden = false
                stage += 1
            }
        } else {
            if (stage == 1){
                firstP.text = guestOne.text
                firstP.isHidden = false
                stage += 1
            } else if (stage == 2){
                secondP.text = guestOne.text
                secondP.isHidden = false
                stage += 1
            } else if (stage == 3){
                thirdP.text = guestOne.text
                thirdP.isHidden = false
                stage += 1
            } else if (stage == 4){
                fourP.text = guestOne.text
                fourP.isHidden = false
                stage += 1
            } else if (stage == 5){
                fiveP.text = guestOne.text
                fiveP.isHidden = false
                stage += 1
            }
        }
    }
    
    @IBAction func guestTwoPressed(_ sender: Any) {
        disableButtons()
        guestTwo.isHidden = true
        bGuestTwo.isEnabled = false
        if (!secondStage){
            if (stage == 0){
                firstP.text = guestTwo.text
                firstP.isHidden = false
                stage += 1
            } else if (stage == 1){
                secondP.text = guestTwo.text
                secondP.isHidden = false
                stage += 1
            } else if (stage == 2){
                thirdP.text = guestTwo.text
                thirdP.isHidden = false
                stage += 1
            } else if (stage == 3){
                fourP.text = guestTwo.text
                fourP.isHidden = false
                stage += 1
            } else if (stage == 4){
                fiveP.text = guestTwo.text
                fiveP.isHidden = false
                stage += 1
            }
        } else {
            if (stage == 1){
                firstP.text = guestTwo.text
                firstP.isHidden = false
                stage += 1
            } else if (stage == 2){
                secondP.text = guestTwo.text
                secondP.isHidden = false
                stage += 1
            } else if (stage == 3){
                thirdP.text = guestTwo.text
                thirdP.isHidden = false
                stage += 1
            } else if (stage == 4){
                fourP.text = guestTwo.text
                fourP.isHidden = false
                stage += 1
            } else if (stage == 5){
                fiveP.text = guestTwo.text
                fiveP.isHidden = false
                stage += 1
            }
        }
    }
    
    @IBAction func bridePressed(_ sender: Any) {
        disableButtons()
        bride.isHidden = true
        bBride.isEnabled = false
        if (!secondStage){
            if (stage == 0){
                firstP.text = bride.text
                firstP.isHidden = false
                stage += 1
            } else if (stage == 1){
                secondP.text = bride.text
                secondP.isHidden = false
                stage += 1
            } else if (stage == 2){
                thirdP.text = bride.text
                thirdP.isHidden = false
                stage += 1
            } else if (stage == 3){
                fourP.text = bride.text
                fourP.isHidden = false
                stage += 1
            } else if (stage == 4){
                fiveP.text = bride.text
                fiveP.isHidden = false
                stage += 1
            }
        } else {
            if (leftPosition){
                if (stage < 5){
                    groom.isHidden = true
                    bGroom.isEnabled = false
                    bride.isHidden = true
                    bBride.isEnabled = false
                }
                if (stage == 5){
                    prompt.text = "The Bride can not be placed here. Please choose a different attendee."
                } else if (stage == 1){
                    secondP.text = groom.text
                    firstP.text = bride.text
                    secondP.isHidden = false
                    firstP.isHidden = false
                    stage += 2
                } else if (stage == 2){
                    thirdP.text = groom.text
                    secondP.text = bride.text
                    thirdP.isHidden = false
                    secondP.isHidden = false
                    stage += 2
                } else if (stage == 3){
                    fourP.text = groom.text
                    thirdP.text = bride.text
                    fourP.isHidden = false
                    thirdP.isHidden = false
                    stage += 2
                } else if (stage == 4){
                    fiveP.text = groom.text
                    fourP.text = bride.text
                    fiveP.isHidden = false
                    fourP.isHidden = false
                    stage += 2
                }
            }
        }
    }
    
    @IBAction func guestThreePressed(_ sender: Any) {
        guestThree.isHidden = true
        bGuestThree.isEnabled = false
        if (!secondStage){
            if (stage == 0){
                firstP.text = guestThree.text
                firstP.isHidden = false
                stage += 1
            } else if (stage == 1){
                secondP.text = guestThree.text
                secondP.isHidden = false
                stage += 1
            } else if (stage == 2){
                thirdP.text = guestThree.text
                thirdP.isHidden = false
                stage += 1
            } else if (stage == 3){
                fourP.text = guestThree.text
                fourP.isHidden = false
                stage += 1
            } else if (stage == 4){
                fiveP.text = guestThree.text
                fiveP.isHidden = false
                stage += 1
            }
        } else {
            if (stage == 1){
                firstP.text = guestThree.text
                firstP.isHidden = false
                stage += 1
            } else if (stage == 2){
                secondP.text = guestThree.text
                secondP.isHidden = false
                stage += 1
            } else if (stage == 3){
                thirdP.text = guestThree.text
                thirdP.isHidden = false
                stage += 1
            } else if (stage == 4){
                fourP.text = guestThree.text
                fourP.isHidden = false
                stage += 1
            } else if (stage == 5){
                fiveP.text = guestThree.text
                fiveP.isHidden = false
                stage += 1
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        for person in seatsArray{
            person.text = ""
        }
        for lab in guestLabArray{
            lab.isHidden = false
        }
        for but in guestButArray{
            but.isEnabled = true
        }
        subButton.isHidden = true
        response.isHidden = true
        response.text = ""
        nextBut.isEnabled = true
        stage = 0
        secondStage = false
        compileAns.text = ""
        prompt.text = "A groom, bride, and three friends would like to sit at a table together. How many different seating arrangements are possible?"

    }
    
    func showResponseTools(){
        subButton.isHidden = false
        response.isHidden = false
        nextBut.isEnabled = false
    }
    
    func hideResponseTools(){
        subButton.isHidden = true
        response.isHidden = true
        response.text = ""
        nextBut.isEnabled = true
    }
    
    func setSecondStage(){
        for person in seatsArray{
            person.text = ""
        }
        for lab in guestLabArray{
            lab.isHidden = false
        }
        for but in guestButArray{
            but.isEnabled = true
        }
        compileAns.text = ""
    }
    
    func disableButtons(){
        for but in guestButArray{
            but.isEnabled = false
        }
    }
    
    func enableButtons(){
        for but in guestButArray{
            but.isEnabled = true
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
