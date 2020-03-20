//
//  AppDescriptionViewController.swift
//  KnowMe
//
//  Created by Peter Andrew on 17/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

class AppDescriptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeModals(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
