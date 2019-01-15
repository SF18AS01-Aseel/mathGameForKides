//
//  ViewController.swift
//  mathGame1
//
//  Created by Aseel Alshohatee on 1/14/19.
//  Copyright © 2019 Aseel Alshohatee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //    var randomInt1: Int = Int.random(in: 0...100);
    //    var randomInt2 = Int.random(in: 0...100);
    var score: Int = 0;
    @IBOutlet var askingUser: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mulButton: UIButton!
    @IBOutlet weak var guessLabel: UILabel!
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var fristNumberLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var signOfOperationLabel: UILabel!
    @IBOutlet weak var textFieldUserGuess: UITextField!
    @IBOutlet weak var equalSignLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideTheOperationButton()
        hideTheQuestionButtonAndlabel()
        
    }
    func hideTheOperationButton()
    {
        askingUser.isHidden = true
        addButton.isHidden = true
        mulButton.isHidden = true
        subButton.isHidden = true
    }
    
    func exposeTheOperationButton()
    {
        askingUser.isHidden = false
        titleLabel.isHidden = true
        addButton.isHidden = false
        mulButton.isHidden = false
        subButton.isHidden = false
    }
    
    func hideTheQuestionButtonAndlabel(){
        guessLabel.isHidden = true
        fristNumberLabel.isHidden = true
        messageLabel.isHidden = true
        signOfOperationLabel.isHidden = true
        textFieldUserGuess.isHidden = true
        equalSignLabel.isHidden = true
        resultLabel.isHidden = true
        scoreLabel.isHidden = true
        exitButton.isHidden = true
        totalScore.isHidden = true
    }
    
    func exposeTheQuestionButtonAndlabel(){
        guessLabel.isHidden = false
        fristNumberLabel.isHidden = false
        messageLabel.isHidden = false
        signOfOperationLabel.isHidden = false
        textFieldUserGuess.isHidden = false
        equalSignLabel.isHidden = false
        resultLabel.isHidden = false
        scoreLabel.isHidden = false
        exitButton.isHidden = false
    }
    
    func randomGeneratorForAdditon(){
        let randomInt1: Int = Int.random(in: 0...100);
        let randomInt2 : Int = Int.random(in: 0...100);
        let add: Int = Int(randomInt1 + randomInt2 )
        
        
        fristNumberLabel.text = String (randomInt1)
        resultLabel.text = String (add)
        signOfOperationLabel.text = "+"
        
    }
    
    func randomGeneratorForSubtraction(){
        let randomInt1: Int = Int.random(in: 0...100);
        let randomInt2 : Int = Int.random(in: 0...100);
        let sub: Int = Int(randomInt1 - randomInt2 )
        
        
        fristNumberLabel.text = String (randomInt1)
        resultLabel.text = String (sub)
        signOfOperationLabel.text = "-"
        
    }
    
    func randomGeneratorForMultipltion(){
        let randomInt1: Int = Int.random(in: 0...10);
        let randomInt2 : Int = Int.random(in: 0...10);
        let sub: Int = Int(randomInt1 * randomInt2 )
        
        
        fristNumberLabel.text = String (randomInt1)
        resultLabel.text = String (sub)
        signOfOperationLabel.text = "x"
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        // expose the button so the user can choose one of the operation
        exposeTheOperationButton()
        sender.isHidden = true
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        //after the user pick one of the operation
        // all the buttons will hide from the screen
        hideTheOperationButton()
        exposeTheQuestionButtonAndlabel()
        randomGeneratorForAdditon()
        
    }
    
    @IBAction func subButtonPressed(_ sender: UIButton) {
        hideTheOperationButton()
        exposeTheQuestionButtonAndlabel()
        randomGeneratorForSubtraction()
    }
    
    @IBAction func mulButtonPressed(_ sender: UIButton) {
        hideTheOperationButton()
        exposeTheQuestionButtonAndlabel()
        randomGeneratorForMultipltion()
    }
    
    @IBAction func primaryActionTrigger(_ sender: UITextField) {
        sender.resignFirstResponder()
        //for add
        if signOfOperationLabel.text! == "+"{
            let x: Int =  Int(fristNumberLabel.text!)! + Int(sender.text!)!
            if x == Int(resultLabel.text!)!{
                score += 1;
                scoreLabel.text = String( "Score:\(score)")
                messageLabel.text = "correct"
                randomGeneratorForAdditon()
                
            }else {
                score -= 1;
                scoreLabel.text =  String( "Score:\(score)")
                messageLabel.text = "wrong input or answer"
                
            }
            
        }
        //sum
        if signOfOperationLabel.text! == "-"{
            let x: Int =  Int(fristNumberLabel.text!)! - Int(sender.text!)!
            if x == Int(resultLabel.text!)!{
                score += 1;
                scoreLabel.text = String( "Score:\(score)")
                messageLabel.text = "correct"
                randomGeneratorForSubtraction()
                
            }else {
                score -= 1;
                scoreLabel.text =  String( "Score:\(score)")
                messageLabel.text = "wrong input or answer"
                
            }
            
        }
        // mul
        if signOfOperationLabel.text! == "x"{
            let x: Int =  Int(fristNumberLabel.text!)! * Int(sender.text!)!
            if x == Int(resultLabel.text!)!{
                score += 1;
                scoreLabel.text = String( "Score:\(score)")
                messageLabel.text = "correct"
                randomGeneratorForMultipltion()
                
                
            }else {
                score -= 1;
                scoreLabel.text =  String( "Score:\(score)")
                messageLabel.text = "wrong input or answer"
                
            }
            
        }
        
        
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        hideTheOperationButton()
        hideTheQuestionButtonAndlabel()
        totalScore.isHidden = false
        if score > 5{
            totalScore.text = String("keep it up\n You total score is \(score) ")
        } else {
            totalScore.text = String("You should study more\n You total score is \(score)")
        }
    }
}

//    @IBAction func calcButtonPressed(_ sender: UITextField, _ sender2: UIButton) {
//        func textfieldPrim(_ sender: UITextField, _ firstNum: Int) {
//
//        if signOfOperationLabel.text! == "+"{
//            var _: Int =  firstNum + Int(sender.text!)!
//
//        } }
