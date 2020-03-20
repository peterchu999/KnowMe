//
//  MakeQuizViewController.swift
//  KnowMe
//
//  Created by Peter Andrew on 18/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

class MakeQuizViewController: UIViewController {

    @IBOutlet weak var buttonNew: InGameButton!
    @IBOutlet weak var buttonNext: RoundedButton!
    @IBOutlet weak var buttonBack: RoundedButton!
    @IBOutlet weak var buttonSave: InGameButton!
    @IBOutlet weak var textViewQuestion: TextViewRounded!
    @IBOutlet weak var switchTrue: UISwitch!
    @IBOutlet weak var switchFalse: UISwitch!
    @IBOutlet weak var OptionContainer: UIView!
    @IBOutlet weak var labelWarning: UILabel!
    
    @IBOutlet weak var labelCounter: UILabel!
    var AnswerState:Bool = true
    var arrayQuestion:[Question] = []
    var index = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeAnswer()
        labelWarning.alpha = 0
        arrayQuestion.append(Question("",true))
        labelCounter.text = "\(index) from \(arrayQuestion.count)"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    private func changeAnswer(){
        if(AnswerState){
            switchTrue.setOn(true, animated: true)
            switchFalse.setOn(false, animated: true)
        } else {
            switchTrue.setOn(false, animated: true)
            switchFalse.setOn(true, animated: true)
        }
    }
    
    @IBAction func changeAnswer(_ sender: Any) {
        print("state: \(AnswerState)| index:\(index) | before")
        AnswerState = !AnswerState
        changeAnswer()
        print("state: \(AnswerState)| index:\(index) | afyter")
    }
    
    private func validateQuestion(text:String) -> Bool{
        let question = text
        if(question.count > 50 || question.count <= 4){
            labelWarning.alpha = 1
            return false
        }
        labelWarning.alpha = 0
        return true
    }
    
    @IBAction func changeQuestion(_ sender: UIButton) {
        if(validateQuestion(text: textViewQuestion.text)){
            switch sender {
                case buttonNew :
                    saveQuestion()
                    if(validateQuestion(text: arrayQuestion[arrayQuestion.count-1].question)){
                        addQuestionToQuiz()
                        index = arrayQuestion.count
                        reinitState()
                    } else {
                        index = arrayQuestion.count
                        reinitState()
                }
                case buttonSave :
                    if(validateQuestion(text: textViewQuestion.text)){
                        saveQuestion()
                        performSegue(withIdentifier: "saveRoom", sender: self)
                }
                default :
                print("Error On Handling changing Question")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "saveRoom" {
                if let destination = segue.destination as? MakeQuizCodeViewController{
                    let data = sender as? MakeQuizViewController
                    destination.quizData = Quiz(data!.arrayQuestion,"")
                    
                }
            }
        }
    }
    
    private func reinitState(){
        let question = arrayQuestion[arrayQuestion.count-1]
        AnswerState = question.answer
        textViewQuestion.text = question.question
        labelCounter.text = "\(index) from \(arrayQuestion.count)"
    }
    
    private func setFieldFromArr(){
        let question = arrayQuestion[index-1]
        AnswerState = question.answer
        textViewQuestion.text = question.question
        changeAnswer()
        labelCounter.text = "\(index) from \(arrayQuestion.count)"
    }
    
    private func saveQuestion(){
        let question = Question(textViewQuestion.text,AnswerState)
        arrayQuestion[index-1] = question
    }
    
    private func addQuestionToQuiz(){
      arrayQuestion.append(Question("",AnswerState))
    }
    
    @IBAction func moveQuestion(_ sender: UIButton) {
        if(validateQuestion(text: textViewQuestion.text)){
            saveQuestion()
            switch sender {
            case buttonBack:
                if(index>1) {
                    index-=1
                    setFieldFromArr()
                }
            case buttonNext:
                if(index<arrayQuestion.count) {
                    index+=1
                    setFieldFromArr()
                }
            default :
                print("Error On Fault")
            }
        }
    }
    
}
