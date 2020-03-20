//
//  PlayCodeViewController.swift
//  KnowMe
//
//  Created by Peter Andrew on 19/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

class PlayCodeViewController: UIViewController {

    @IBOutlet weak var textFieldCode: UITextField!
    @IBOutlet weak var labelWarning: UILabel!
    var code:String = ""
    var quiz:Quiz?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelWarning.alpha = 0
        quiz = DataStore.getInstance().getQuiz()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func editingChange(_ sender: Any) {
        if(textFieldCode.text!.count == 6){
            code = textFieldCode.text!
            if let quiz = self.quiz{
                print("quizkey: \(quiz.key) | code: \(code)")
                if quiz.key == code {
                    performSegue(withIdentifier: "toGame", sender: quiz)
                } else {
                    labelWarning.text = "ROOM KEY INVALID"
                    labelWarning.alpha = 1
                }
            } else {
                labelWarning.text = "NO ROOM AVAIL PLEASE CREATE ONE"
                labelWarning.alpha = 1
            }
           
        } else if(textFieldCode.text!.count > 6) {
            textFieldCode.text! = code
        }
    }
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toGame"{
                if let destination = segue.destination as? GameViewController{
                    if let data = sender as? Quiz{
                        destination.quiz = data
                    }
                }
            }
        }
    }
    
}
