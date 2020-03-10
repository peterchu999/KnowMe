//
//  FactView.swift
//  KnowMe
//
//  Created by Peter Andrew on 07/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

class FactView {
    
    private static var view:UIScrollView?
    private static var label:UILabel?
    private static var image:UIImageView?
    private static var scrollView:UIScrollView?
    init(view:UIScrollView, label:UILabel, image:UIImageView){
        FactView.view = view
        FactView.label = label
        FactView.image = image
        FactView.hide()
    }
    
    static func show(counter:Int){
        let correctCounter = counter
        FactView.label!.text = correctCounter>4 ? "Wow You Got \(correctCounter)/8 Correct Answer !" : "You Need To See The Fact \(correctCounter)/8 Correct Answer..."
        FactView.image?.image = correctCounter>4 ? #imageLiteral(resourceName: "Hooray") :#imageLiteral(resourceName: "sad")
        view!.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        view!.isHidden = false
        
    }
    
    static func hide(){
        view!.isHidden = true
    }
    
    public func changeState(){
        FactView.hide()
        QuizView.show()
    }
    
    
}
