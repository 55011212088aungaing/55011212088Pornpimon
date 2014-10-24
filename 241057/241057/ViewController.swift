//
//  ViewController.swift
//  241057
//
//  Created by Student on 10/24/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,ColorTwoViewControllerDelegate{

    @IBOutlet var colorlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func myVCDidFinish(controller: ColorTwoViewController, text: String) {
        colorlabel.text = "Co: " + text
        controller.navigationController?.popViewControllerAnimated(true)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "mySegue"{
            let  vc = segue.destinationViewController as ColorTwoViewController
            vc.colorString = colorlabel.text!
            vc.delegate = self
        }

    }

}