//
//  TipCalaulator.swift
//  TipCalculator
//
//  Created by Student on 12/9/57.
//  Copyright (c) พ.ศ. 2557 Student. All rights reserved.
//

import Foundation
class TipCalculator {
    //2
    var total : Double
    var taxPct : Double
    var subtotal : Double{
        get{
            return total / (taxPct + 1)
        }
    }
    
    //3
    init(total:Double, taxPct:Double){
        self.total = total
        self.taxPct = taxPct
        //subtotal = total / (taxPct + 1)
    }
    //4
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double){
        let tipAmt = subtotal * tipPct
        let finaTotal = total + tipAmt
        return (tipAmt, finaTotal)
        
    }
    //1
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)]{
        let possibleTipsInferred = [0.15,0.18,0.20]
        let possibleTipsExplicit:[Double] = [0.15,0.18,0.20]
        var numberOfItems = possibleTipsInferred.count
        
        //2
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            //3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

