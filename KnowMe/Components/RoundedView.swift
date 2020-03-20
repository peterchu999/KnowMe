//
//  RoundedView.swift
//  KnowMe
//
//  Created by Peter Andrew on 18/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

class RoundedView: UILabel {
    public override init(frame: CGRect) {
        super.init(frame:frame)
        initRounded()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initRounded()
    }
    
    private func initRounded(){
        let layer = self.layer
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
}
