//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Chris Brown on 8/26/16.
//  Copyright © 2016 Chris Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tipCalculation = TipCalculatorModel(total: 33.75, taxPercent: 0.0825)
    
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPercentSlider : UISlider!
    @IBOutlet var taxPercentLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    @IBAction func calculateTapped(sender : AnyObject) {
        tipCalculation.total = Double((totalTextField.text! as NSString).doubleValue)
        
        let possibleTips = tipCalculation.returnPossibleTips()
        
        var results: String = ""
        var keys = Array(possibleTips.keys)
        
        keys.sortInPlace()
        
        for tipPercent in keys {
            let tipValue = possibleTips[tipPercent]!
            let prettyTipValue = String(format:"%.2f", tipValue)
            results += "\(tipPercent)%: \(prettyTipValue)\n"
        }
        
        resultsTextView.text = results
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalculation.taxPercent = Double(taxPercentSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalculation.total)
        taxPercentSlider.value = Float(tipCalculation.taxPercent) * 100.0
        taxPercentLabel.text = "Tax Percentage (\(Int(taxPercentSlider.value))%)"
        resultsTextView.text = ""
    }
}

