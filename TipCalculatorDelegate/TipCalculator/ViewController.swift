//
//  ViewController.swift
//  TipCalculator
//
//  Created by Student on 12/9/57.
//  Copyright (c) พ.ศ. 2557 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate{
    
    @IBOutlet var totalTextField:UITextField!
    @IBOutlet var textPctSlider : UISlider!
    @IBOutlet var textPctLabel : UILabel!
    @IBOutlet var tabelview: UITableView!
    
    
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
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    func refreshUI(){
        //1
        totalTextField.text = String(format:"%0.2f",tipCalc.total)
        //2
        textPctSlider.value = Float(tipCalc.taxPct) * 100.0
        //3
        textPctLabel.text = "Tex percentage(\(Int(textPctSlider.value))%)"
        //4
        //resultsTextView.text = ""
    }
    
    
    func tableView(tableView: UITableView!, inumberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    func numberOfSactionInTableView(tableView: UITableView!)->Int{
        return 1
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        
    }
    func tableView(tableView: UITableView!,cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier:nil)
        
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel!.text = "\(tipPct)%"
        cell.detailTextLabel!.text = String(format:"Tip: $%0.2f, total:$%0.2f", tipAmt, total)
        return cell
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

