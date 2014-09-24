//
//  ViewController.swift
//  TipCalculator
//
//  Created by Student on 12/9/57.
//  Copyright (c) พ.ศ. 2557 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextField:UITextField!
    @IBOutlet var textPctSlider : UISlider!
    @IBOutlet var textPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    @IBAction func  calculateTapped(sender :AnyObject){
    //1
    tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        //2
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        //3
        for (tipPct, tipValue) in possibleTips{
            //4
            results += "\(tipPct)%: \(tipValue)\n"
        }
        //5
        resultsTextView.text = results
    }
    @IBAction func  textPercentageChanged(sender :AnyObject){
        tipCalc.taxPct = Double(textPctSlider.value)/100.0
        refreshUI()
    }
    @IBAction func  viewTapped(sender :AnyObject){
        totalTextField.resignFirstResponder()
    }
    
    let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
    func refreshUI(){
        //1
        totalTextField.text = String(format:"%0.2f",tipCalc.total)
        //2
        textPctSlider.value = Float(tipCalc.taxPct) * 100.0
        //3
        textPctLabel.text = "Tex percentage(\(Int(textPctSlider.value))%)"
        //4
        resultsTextView.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

