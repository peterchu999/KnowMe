//
//  CustomView.swift
//  KnowMe
//
//  Created by Peter Andrew on 16/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIButton {
    var image:UIImageView
    public override init(frame: CGRect) {
        self.image = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        super.init(frame:frame)
        self.addSubview(image)
    }
    public required init?(coder: NSCoder) {
        self.image = UIImageView()
        super.init(coder: coder)
        self.image.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(image)
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.image.layer.cornerRadius = self.cornerRadius
            self.image.layer.masksToBounds = true
        }
    }
    
    @IBInspectable
    public var insideImage: UIImage = #imageLiteral(resourceName: "people card"){
        didSet{
            self.image.image = self.insideImage
        }
    }
    
    @IBInspectable
    public var shadow: Bool = false {
        didSet {
            if(shadow){
                let shadowLayer = self.layer
                shadowLayer.shadowPath =
                      UIBezierPath(roundedRect: self.bounds,
                      cornerRadius: layer.cornerRadius).cgPath
                shadowLayer.shadowColor = UIColor.black.cgColor
                shadowLayer.shadowOpacity = 0.4
                shadowLayer.shadowOffset = CGSize(width: 0, height: 15)
                shadowLayer.shadowRadius = 10
                self.layer.masksToBounds = false
            }
        }
    }
    
   
}
