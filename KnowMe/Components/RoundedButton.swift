//
//  RoundedButton.swift
//  KnowMe
//
//  Created by Peter Andrew on 16/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class RoundedButton: UIButton {

    public override init(frame: CGRect) {
        super.init(frame:frame)
        initRoundAndShadow()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initRoundAndShadow()
    }
    
    private func initRoundAndShadow(){
        let layer = self.layer
        layer.cornerRadius = 25
        let shadowLayer = self.layer
        shadowLayer.shadowPath =
              UIBezierPath(roundedRect: self.bounds,
              cornerRadius: layer.cornerRadius).cgPath
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowOffset = CGSize(width: 0, height: 10)
        shadowLayer.shadowRadius = 10
    }
    
    @IBInspectable
    public var roundPx: CGFloat = 25 {
        didSet {
            self.layer.cornerRadius = roundPx
        }
    }
    
}
