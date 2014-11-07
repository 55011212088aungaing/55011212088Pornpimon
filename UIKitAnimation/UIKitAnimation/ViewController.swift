//
//  ViewController.swift
//  UIKitAnimation
//
//  Created by Student on 11/7/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    
    var square: UIView!
    var snap: UISnapBehavior!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    var collision: UICollisionBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        
        //ใส่สี่เหลี่ยม
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        //เรียกใช้ตัวแปรแรงดึงดูด
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        //ใช้ตัวแปรขอบเขต
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        
        collision.action = {
            println("\(NSStringFromCGAffineTransform(self.square.transform)) \(NSStringFromCGPoint(self.square.center))")
        }
        
        collision.collisionDelegate = self
        let itemBahaviour = UIDynamicItemBehavior(items: [square])
        itemBahaviour.elasticity = 0.6
        animator.addBehavior(itemBahaviour)
        
        
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        
    }
    
    func collisionBehavior(behavior:UICollisionBehavior!,beganContactForItem item:UIDynamicItem!,withBoundaryIdentifier identifier:NSCopying!,atPoint p: CGPoint){
        
        println("Boundary contact occurred - \(identifier)")
        
        let collidingView = item as UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3){
            collidingView.backgroundColor = UIColor.grayColor()
        }
        
        var firstContact = false
        if(!firstContact){
            firstContact = true
            
            let square = UIView(frame: CGRect(x: 30, y: 0, width: 30, height: 30))
            square.backgroundColor = UIColor.grayColor()
            view.addSubview(square)
            
            collision.addItem(square)
            gravity.addItem(square)
            
            let attach = UIAttachmentBehavior(item: collidingView, attachedToItem: square)
            animator.addBehavior(attach)
            
            
        }
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if(snap != nil){
            animator.removeBehavior(snap)
            
        }
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}