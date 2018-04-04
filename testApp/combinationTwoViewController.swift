//
//  combinationTwoViewController.swift
//  allPrototype
//
//  Created by Dylan Shane on 8/8/17.
//  Copyright © 2017 Dylan Shane. All rights reserved.
//

import UIKit

class combinationTwoViewController: UIViewController {

    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var nextBut: UIButton!
    @IBOutlet weak var resetBut: UIButton!
    @IBOutlet weak var submitBut: UIButton!
    
    @IBOutlet weak var parenthesis: UILabel!
    @IBOutlet weak var botAns: UITextField!
    @IBOutlet weak var topAns: UITextField!
    
    @IBOutlet weak var wOne: UILabel!
    @IBOutlet weak var wTwo: UILabel!
    @IBOutlet weak var wThree: UILabel!
    @IBOutlet weak var wFour: UILabel!
    @IBOutlet weak var wFive: UILabel!
    
    @IBOutlet weak var woOne: UILabel!
    @IBOutlet weak var woTwo: UILabel!
    @IBOutlet weak var woThree: UILabel!
    @IBOutlet weak var woFour: UILabel!
    @IBOutlet weak var woFive: UILabel!
    @IBOutlet weak var woSix: UILabel!
    @IBOutlet weak var woSeven: UILabel!
    @IBOutlet weak var woEight: UILabel!
    @IBOutlet weak var woNine: UILabel!
    @IBOutlet weak var woTen: UILabel!
    
    @IBOutlet weak var compileAns: UILabel!
    
    private var stage = 0
    
    private var groupWith: [UILabel] = []
    private var groupWithout: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prompt.text = "How many committees of three can be made from the seven people above if the two on the left will only serve on the committee if they are together?"
        
        groupWith.append(contentsOf: [wOne, wTwo, wThree, wFour, wFive])
        groupWithout.append(contentsOf: [woOne, woTwo, woThree, woFour, woFive, woSix, woSeven, woEight, woNine, woTen])
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
            prompt.text = "To solve this, first lets figure out how many committees could be made if we included the pair that must be together. Press next."
            stage += 1
        } else if (stage == 1){
            prompt.text = "How many committees of three could be made if we included the pair that insists on serving together?"
            showResponseTools()
            stage += 1
        } else if (stage == 2){
            prompt.text = "Above are the five possible committee    s that could be made if we included the pair. However, what if we didn't include the pair that insists on being together?"
            showEmoji(emojiGroup: groupWith)
            stage += 1
        } else if (stage == 3){
            prompt.text = "How many committees of three could be made if we did not include the pair that will only serve if they are together?"
            hideEmoji(emojiGroup: groupWith)
            stage += 1
            showResponseTools()
        } else if (stage == 4){
            prompt.text = "Above are the ten possible committee combinations that could be made if we did not include the pair. Press next."
            showEmoji(emojiGroup: groupWithout)
            stage += 1
        } else if (stage == 5){
            prompt.text = "Therefore, to answer our orignal question, there are 15 possible committee combinations that satisfy the pairs request to only serve if they're together."
            hideEmoji(emojiGroup: groupWithout)
            compileAns.text = "5 + 10 = 15"
        }
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if (stage == 2){
            if (topAns.text == "5" && botAns.text == "1"){
                prompt.text = "Correct! We only have one spot left to fill for our committee and five people left to choose from since the pair is already a part of the committee."
                compileAns.text = "5"
                compileAns.isHidden = false
                hideResponseTools()
            } else {
                prompt.text = "Incorrect. Remember we have already decided two spots on the committee since we are including the pair. How many committes of three could be made if we included the pair that insists on serving together?"
            }
        } else if (stage == 4){
            if (topAns.text == "5" && botAns.text == "3"){
                prompt.text = "Correct! We have three spots to fill for the committee and only five people to choose from since the pair will not be included."
                compileAns.text = "5 + 10"
                hideResponseTools()
            } else {
                prompt.text = "Incorrect. Remember, we are not including the two people who will only serve together. How many committees of three could be made if we did not include the pair that will only serve together?"
            }
        }
    }
    
    func showResponseTools(){
        parenthesis.isHidden = false
        topAns.isHidden = false
        botAns.isHidden = false
        submitBut.isHidden = false
        nextBut.isEnabled = false
    }
    
    func hideResponseTools(){
        parenthesis.isHidden = true
        topAns.text = ""
        topAns.isHidden = true
        botAns.text = ""
        botAns.isHidden = true
        submitBut.isHidden = true
        nextBut.isEnabled = true
    }
    
    func showEmoji(emojiGroup: [UILabel]){
        for emoji in emojiGroup{
            emoji.isHidden = false
        }
    }
    
    func hideEmoji(emojiGroup: [UILabel]){
        for emoji in emojiGroup{
            emoji.isHidden = true
        }
    }

    @IBAction func reset(_ sender: Any) {
    }
}
