//
//  UICustom.swift
//  KnowMe
//
//  Created by Peter Andrew on 07/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

class UICustom{
    
    static func roundedView(view:UIView , radius:CGFloat){
        let layer = view.layer
        layer.cornerRadius = radius
        layer.masksToBounds = true
        layer.masksToBounds = false
    }
    
    static func roundedButton(button:UIButton, radius:CGFloat){
        let layer = button.layer
        layer.cornerRadius = radius
    }
    
    static func shadowButton(button:UIButton, shadowOffset: CGSize){
        let layer = button.layer
        layer.shadowPath =
              UIBezierPath(roundedRect: button.bounds,
              cornerRadius: layer.cornerRadius).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
    
    static func animateView(view:UIView,duration:Double,direction:String,function :(()->Void)?=nil){
        var xCoordinate:CGFloat
        var yCoordinate:CGFloat
        var rotation:CGFloat
        if(direction == "left"){
            xCoordinate = 300
            yCoordinate = 100
            rotation = CGFloat.pi/5
        } else if(direction == "right"){
            xCoordinate = -300
            yCoordinate = 100
            rotation = -CGFloat.pi/5
        } else {
            xCoordinate = 0
            yCoordinate = 0
            rotation = 0
        }
        UIView.animate(withDuration: duration, animations:{
           let translate = CGAffineTransform(translationX: xCoordinate, y: yCoordinate)
            let rotate = CGAffineTransform(rotationAngle: rotation);
            view.transform = rotate.concatenating(translate)
            view.alpha = 0
        }, completion: {(true) in
            let translate = CGAffineTransform(translationX: 0, y: 0)
            let rotate = CGAffineTransform(rotationAngle: 0)
            if let functions = function {
                functions()
            }
            view.transform = rotate.concatenating(translate)
            UIView.animate(withDuration: duration, animations: {
                view.alpha = 1
            }, completion: nil)
        })
    }
    
    static func animateFadeInOutButton(button:UIButton, duration: Double){
        button.isEnabled = false
        UIButton.animate(withDuration: duration, animations:{
            button.alpha = 0
        },completion: {(true) in
            button.isEnabled = true
            button.transform = CGAffineTransform(scaleX: 0, y: 0)
            button.alpha = 1
            UIButton.animate(withDuration: (duration*8/10), animations:{
                button.transform = CGAffineTransform(scaleX: 1, y: 1)})
        })
    }
    
}
