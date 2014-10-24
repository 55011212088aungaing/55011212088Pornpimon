//
//  ViewController.swift
//  Exam1_55011212088
//
//  Created by Student on 10/10/2557 BE.
//  Copyright (c) 2557 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var volume: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var BTotal: UIButton!
    @IBOutlet weak var profit: UIButton!
    @IBOutlet weak var tabelview: UITableView!
    @IBAction func ActionName(sender: AnyObject) {
       // name.text = new name(" ")
    }
    
    @IBAction func ActionVolume(sender: AnyObject) {
        volume.textInputContextIdentifier
    }
    @IBAction func ActionPrice(sender: AnyObject) {
        price.textInputContextIdentifier
    }
    
    @IBAction func ActionTotal(sender: AnyObject) {
        //var sum = volume * price
        //ShowTotal.text(sum)
    }
    
    @IBAction func ActionProfit(sender: AnyObject) {
        
    }
    
    /*func tableView(tableView: UITableView!, numberOfRowsInSection section:Int) ->Int{
        //return sortedKeys.count
    
    }*/
    
    func numberOfRowSectionInTabelView(tabelView: UITableView!) -> Int{
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

