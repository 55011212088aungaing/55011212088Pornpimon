//
//  ViewController.swift
//  Exam1_55011212088
//
//  Created by Student on 12/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource{
    var items = [String]()
   // var items = [NSManagedObject()]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addItem(sender: AnyObject) {
        var alert = UIAlertController(title: "new item", message: "Add new item", preferredStyle: .Alert)
        
        let SaveAction = UIAlertAction(title: "Save", style: .Default){(action: UIAlertAction!)->Void in
            let TextField = alert.textFields![0] as UITextField
            self.items.append(TextField.text)
            self.tableView.reloadData()
        }

        
        let CancelAction = UIAlertAction(title: "Cancel",style: .Default) { (action: UIAlertAction!) -> Void in}
        
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField!)-> Void in
        }
        alert.addAction(SaveAction)
        alert.addAction(CancelAction)
        
        presentViewController(alert,animated: true,completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Stok\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")as UITableViewCell
        cell.textLabel!.text = items[indexPath.row]
        return cell
    }
    
    /*func saveName(name: String){
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        item.setValue(name, forKey:"name")
        
        //4
        var error:NSError?
        if !managedContext.save(&error){
            println("Could not save \(error),\(error?.userInfo)")
        }
        //5
        items.append(item)
        
    }*/



}

