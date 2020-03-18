//
//  MakeQuizViewController.swift
//  KnowMe
//
//  Created by Peter Andrew on 18/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

class MakeQuizViewController: UIViewController {

    @IBOutlet weak var OptionContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let view = MakeQuizInput(frame: CGRect(x: 0, y: 0, width: OptionContainer.frame.width, height: OptionContainer.frame.width))
        view.setLabelText(<#T##text: String##String#>)
        OptionContainer.addSubview(view)
        
    }
    
}
