//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

arc4random() % 10000
arc4random() % 10000

var teststring:String = "123"

var length = teststring.characters.count

for character in teststring.characters{
    print(character)
}

var Answer:String = "1322"

func CompareAnswer(_ InsertAnswer:String) -> String {
    
    var result = ""
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
    result = "\(NumberA)A\(NumberB)B"
    
    return result
}

CompareAnswer("4321")
CompareAnswer("1342")
CompareAnswer("1236")
CompareAnswer("1322")