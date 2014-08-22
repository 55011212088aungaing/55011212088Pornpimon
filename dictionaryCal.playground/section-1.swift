// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1
func returnPossibleTips() -> [Int: Double]{
    
    let possibleTipsInferred = [0.15, 0.18, 0.20]
    let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
    
    //2
    var retval = Dictionary<Int, Double>()
    for possibleTip in possibleTipsInferred{
        let intPct = Int(possibleTip*100)
        //3
        retval[intPct] = calcTipWithTipPct(possibleTip)
    }
    return retval
}




