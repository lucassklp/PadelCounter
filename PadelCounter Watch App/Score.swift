//
//  Score.swift
//  PadelCounter Watch App
//
//  Created by Lucas Simas on 28/10/2024.
//

import Foundation

@Observable
class Score {
    var myScore: Int = 0
    var theirScore: Int = 0
    var isEven: Bool = false
    
    func hasWinner() -> Bool {
        return imWinner() || theyAreWinner()
    }
    
    private func whoIsWinner(score: Int) -> Bool {
        if(isEven){
            return score > 1
        }
        else{
            return score > 3
        }
    }
    
    func imWinner() -> Bool {
        whoIsWinner(score: myScore)
    }
    
    func theyAreWinner() -> Bool {
        whoIsWinner(score: theirScore)
    }
    
    func incrementMyScore(){
        if(!isEven){
            myScore+=1;
            checkEven()
        }
        else{
            if(theirScore == 1){
                myScore = 0
                theirScore = 0
            }
            else{
                myScore+=1
            }
        }
    }
    
    func incrementTheirScore(){
        if(!isEven){
            theirScore+=1;
            checkEven()
        }
        else{
            if(myScore == 1){
                theirScore = 0
                myScore = 0
            }
            else{
                theirScore+=1
            }
        }
    }

    func decrementMyScore(){
        if(myScore>0){
            myScore-=1;
            checkEven()
        }
    }
    
    func decrementTheirScore(){
        if(theirScore > 0){
            theirScore-=1;
            checkEven()
        }
    }
    
    func checkEven(){
        if(!isEven && myScore == 3 && theirScore == 3){
            reset();
            isEven = true;
        }
    }
    
    func getMyScore() -> String {
        return getScore(score: myScore)

    }
    
    func getTheirScore() -> String {
        return getScore(score: theirScore)
    }
    
    private func getScore(score: Int) -> String  {
        if(!isEven && score < 4){
            if(score == 0){
                return "0"
            }
            else if(score == 1){
                return "15"
            }
            else if(score == 2){
                return "30"
            }
            else {
                return "40"
            }
        }
        else {
            return String(score)
        }
    }
    
    func reset(){
        myScore = 0
        theirScore = 0
        isEven = false
    }
}
