//
//  ViewController.swift
//  CoreImageView
//
//  Created by Student on 10/3/2557 BE.
//  Copyright (c) 2557 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UllmageCiew: UIImageView!
    
    var context:CIContext!
    var filter:CIFilter!
    var beginImage:CIImage!
    var orientation: UIImageOrientation = .Up //new
    
    @IBAction func loadPhoto(sender: AnyObject) {
        let pickerC = UIImagePickerController()
        //pickerC.delegate = self
        self.presentViewController(pickerC, animated:true, completion: nil)
    }
    
    @IBAction func savePhoto(sender: AnyObject) {
        //1
        let imageToSave = filter.outputImage
        //2
        let softwareContext = CIContext(options:[kCIContextUseSoftwareRenderer: true])
        //3
        let cgimg = softwareContext.createCGImage(imageToSave, fromRect:imageToSave.extent())
        //4
        let library = ALAsetsLibary()
        library.writeImageToSavedPhotosAlbum(cgimg, metadata:imageToSave.properties(),completionBlock:nil)
    }
    
    @IBAction func mountSliderValueChanged(sender: AnyObject) {
        let sliderValue = sender.value
        let outputImage = self.oldPhoto(beginImage, fromRect: outputImage.extend())
        let newImage = UIImage(CGImage: cgimg, scale: 1, orientation:orientation)
        self.imageView.image = newImage
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info:NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: nil);
        
        let gotImage = info[UIImagePickerControllerOriginalImage] as UIImage
        
        beginImage = CIImage(image: gotImage)
        orientation = gotImage.imageOrientation
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        self.amountSliderValueChanged(amountSlider)
    }
    
    func logAllFilters(){
        let properties = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        println(properties)
        for filterName: AnyObject in properties{
            let fltr = CIFilter(name: filtername as String)
            println(fltr.attributes())
        }
    }
    
    func oldPhoto(img: CIImage, withAmount  intensity: Float)->CIImage{
        //1
        let sepia = CIFilter(name: "CISepiaTond")
        sepia.setValue(img, forKey: kCIInputImageKey)
        sepia.setValue(intensity, forKey: "inputIntensity")
        //2
        let lighten = CIFilter(name: "CIRandomGenerator")
        
        //3
        let lighten = CIFilter(name: "CIColorContorols")
        lighten.setValue(random.outputImage, forKey: kCIInputImageKey)
        lighten.setValue(1-intensity, forKey: "inputBrightness")
        lighten.setValue(0, forKey: "inputBrightness")
        
        //4
        let croppedImage = lighten.outputImage.imageByCroppingToRect(beginImage.extent())
        
        //5
        let composite = CIFilter(name: "CIHardLightBlendMode")
        composite.setValue(sepia.outputImage, forKey: kCIInputImageKey)
        composite.setValue(croppedImage, forKey:kCIInputBackgroundImageKey)
        
        //6
        let vignette = CIFilter(name: "CIVignette")
        vignette.setValue(composite.outputImage, forKey: kCIInputBackgroundImageKey)
        vignette.setValue(intensity*2, forKey: "inputIntensity")
        vignette.setValue(intensity*30, forKey: "inputRadius")
        
        //7
        return vignette.outputImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1
        let fileURL = NSBundle.mainBundle().URLForResource("image", withExtension: "png")
        //2
        beginImage = CIImage(contentsOfURL: fileURL)
        //3
        filter = CIFilter(name: "CISepiaTone")
        filter.setValue(beginImage, forKey:kCIInputImageKey)
        filter.setValue(0.5, forKey: kCIInputImageKey)
        let outputImage = filter.outputImage
        
        //1
        context = CIContext(options:nil)
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent())
        //2
        let newImage = UIImage(CGImage: cgimg)
        self.imageView.image = newImage
        self.logAllFilters()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

