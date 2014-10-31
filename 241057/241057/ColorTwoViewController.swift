//
//  ColorTwoViewController.swift
//  241057
//
//  Created by Student on 10/24/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit
protocol ColorTwoViewControllerDelegate{
    func myVCDidFinish(controller:ColorTwoViewController,text:String)
}

class ColorTwoViewController: UIViewController {
    var delegate:ColorTwoViewControllerDelegate? = nil
    var colorString = ""

    @IBOutlet weak var titlelabel: UINavigationBar!
    @IBOutlet weak var colorlabel: UILabel!
    @IBAction func savecolor(sender: UIBarButtonItem) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self,text:colorlabel!.text!)
        }
    }
    @IBAction func colorselection(sender: UIButton) {
        colorlabel.text = sender.titleLabel?.text!
        if(sender.titleLabel!.text! == "Red"){
           colorlabel.backgroundColor = UIColor.redColor()
           view.backgroundColor = UIColor.redColor()
            
        }
        else if(sender.titleLabel!.text! == "Green"){
            colorlabel.backgroundColor = UIColor.greenColor()
            view.backgroundColor = UIColor.greenColor()
        }
        else if(sender.titleLabel!.text! == "Blue"){
            colorlabel.backgroundColor = UIColor.blueColor()
            view.backgroundColor = UIColor.blueColor()
        }
        else{
            colorlabel.backgroundColor = UIColor.whiteColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        colorlabel.text = colorString
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
