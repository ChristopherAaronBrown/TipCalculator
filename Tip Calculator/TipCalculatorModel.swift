//
//  TipCalculatorModel.swift
//  Tip Calculator
//
//  Created by Chris Brown on 8/26/16.
//  Copyright © 2016 Chris Brown. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPercent: Double
    var subtotal: Double {
        get {
            return round(100 * total / (1 + taxPercent)) / 100
        }
    }
    
    init(total: Double, taxPercent: Double) {
        self.total = total
        self.taxPercent = taxPercent
    }
    
    func calculateTipWithTipPercent(tipPercent: Double) -> Double {
        return round(100 * subtotal * tipPercent) / 100
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTips: [Double] = [0.15, 0.18, 0.20]
        
        var retval = [Int: Double]()
        
        for possibleTip in possibleTips {
            let intPct = Int(possibleTip*100)
            
            retval[intPct] = calculateTipWithTipPercent(possibleTip)
        }
        
        return retval
    }
}