//
//  OptionInput.swift
//  KnowMe
//
//  Created by Peter Andrew on 18/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

class OptionsInput:UIView{
    var label:UILabel?
    var input:UITextField?
    var button:UIButton?
    public override init(frame: CGRect){
        super.init(frame:frame)
        initInside()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initInside()
    }
    
    private func initInside(){
        initLabel()
        initInput()
        self.addSubview(label!)
        self.addSubview(input!)
    }
    
    private func initLabel(){
        self.label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width*3/4, height: self.frame.height*3/8))
        self.label?.font = UIFont(name: "SF Pro Rounded", size: 24)
        self.label?.textColor = ColorPalettes.createMainText
    }
    
    private func initInput(){
        self.input = UITextField(frame: CGRect(x: 0, y: self.frame.height/2, width: self.frame.width, height: self.frame.height/2))
        input?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        input?.borderStyle = .roundedRect
    }
    
    private func initButton(){
        self.button = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width*3/4, height: self.frame.height*3/8))
    }
    
    public func setLabelText(_ title:String){
        self.label?.text = title
    }
}
