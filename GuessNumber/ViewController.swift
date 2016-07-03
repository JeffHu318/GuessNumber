//
//  ViewController.swift
//  GuessNumber
//
//  Created by WEI on 7/3/16.
//  Copyright © 2016 WEI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var GuessButton: UIButton!
    @IBOutlet weak var Replay: UIButton!
    
    @IBOutlet weak var GuessNumber: UITextField!
    @IBOutlet weak var ResultTextView: UITextView!
    var Answer:String = ""
    var guessingTimes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GenerateAnswer()
        Replay.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GuessClick(_ sender: AnyObject) {
        
        if GuessNumber.text != nil && GuessNumber.text!.characters.count == 4 {
            
        //compare with Answer
            let Guessresult = CompareAnswer(GuessNumber.text!)
            ResultTextView.text = ResultTextView.text + GuessNumber.text! + " is " + Guessresult + " guess \(guessingTimes + 1) Times !!! \n"
            guessingTimes += 1
            
            
            
            if Guessresult == "4A0B" {
                
                ResultTextView.text = ResultTextView.text + "Correct Answer On \(GuessNumber.text!) !!! \n"
                
                GuessButton.isHidden = true
                Replay.isHidden = false
            
            }
            else{
                if guessingTimes >= 6 {
                    ResultTextView.text = ResultTextView.text + "The Answer is \(Answer) \n"
                    
                    GuessButton.isHidden = true
                    Replay.isHidden = false
                    
                }
            }
            
            
            
            GuessNumber.text = ""
            
        }
        else {
            //Insert Format Wrong
        }
    }
    
    @IBAction func ReplayClick(_ sender: AnyObject) {
        
        GenerateAnswer()
        ResultTextView.text = ""
        guessingTimes = 0
        
        Replay.isHidden = true
        GuessButton.isHidden = false
    }
    func CompareAnswer(_ InsertAnswer:String ) -> String {
        
        var countindex = 0
        
        var NumberA = 0;
        var NumberB = 0;
        
        var CompareIndex = [false, false, false, false]
        
        for character in InsertAnswer.characters {
            
            var answerindex = 0
            
            var isAFound = false;
            var isBFound = false;
            var Bindex = 0;
            
            for answerch in Answer.characters {
                
                
                if character == answerch && countindex == answerindex && !CompareIndex[answerindex] {
                    //A
                    isAFound = true
                    NumberA += 1;
                    CompareIndex[answerindex] = true
                    break;
                }
                else if character == answerch && !CompareIndex[answerindex] {
                    //B
                    isBFound = true
                    Bindex = answerindex
                }
                answerindex += 1
            }
            
            if(isBFound && !isAFound)
            {
                //Found B Only
                NumberB += 1;
                CompareIndex[Bindex] = true
            }
            
            countindex += 1
        }
        
        //Put Result
        var result = "\(NumberA)A\(NumberB)B"
        
        return result
    }
    
    func GenerateAnswer() {
        var isNumberOk = false
        while !isNumberOk {
            
            isNumberOk = true
            //Generate Default Answer
            Answer = "\(arc4random() % 10000)"
            var tempArray = ["0","1","2","3"]
            
            //assign number into array
            var index = 0
            for char in Answer.characters {
                tempArray[index] = String(char)
                index += 1
            }
            
            //make sure to same number in string
            for i in 0...3 {
                let Compare = tempArray[i]
                for j in 0...3{
                    if i != j && Compare == tempArray[j] {
                        isNumberOk = false
                    }
                }
            }
        }
    }

}

