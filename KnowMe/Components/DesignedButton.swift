//
//  DesignedButton.swift
//  KnowMe
//
//  Created by Peter Andrew on 16/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class DesignedButton: UIButton {
    var label = UILabel()
    public override init(frame: CGRect) {
        super.init(frame:frame)
        initButtonDefaultState()
        initLabelDefault(frame: frame)
        self.addSubview(label)
        
    }
    
    private func initLabelDefault(frame:CGRect){
        let label = self.label
        label.frame = CGRect(x: frame.width*5/10 - frame.height*15/100, y: frame.height*15/100, width: frame.width*5/10, height: frame.height*7/10)
        label.backgroundColor = .white
        label.textColor = .black
        label.layer.cornerRadius = 28
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.font = self.titleLabel?.font
    }
    
    private func initButtonDefaultState(){
        let layer = self.layer
        layer.cornerRadius = 40
        self.imageView?.layer.cornerRadius = 40
        self.imageView?.layer.masksToBounds = true
        let shadowLayer = CAShapeLayer()
        shadowLayer.shadowPath =
              UIBezierPath(roundedRect: self.bounds,
              cornerRadius: layer.cornerRadius).cgPath
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowOffset = CGSize(width: 0, height: 10)
        shadowLayer.shadowRadius = 10
        
        layer.insertSublayer(shadowLayer, at: 0)
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initLabelDefault(frame: self.frame)
        self.addSubview(label)
        initButtonDefaultState()
    }
    
    @IBInspectable
    public var title: String = "default" {
        didSet {
            self.label.text = self.title
        }
    }
    
    @IBInspectable
    public var labelColor:UIColor = ColorPalettes.homeMainGreen {
        didSet{
            self.label.textColor = self.labelColor
        }
    }
}
