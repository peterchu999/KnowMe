//
//  QuizView.swift
//  KnowMe
//
//  Created by Peter Andrew on 07/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

class QuizView {
    
    private static var instance:QuizView?
    private var statementLabel:UILabel?
    private static var view:UIView!
    struct Question {
        let statement:String
        let answer:Bool
    }
    var questionArray = [Question]()
    var questionCounter = 0
    var correctCounter = 0
    
    init(){
        initQuestion()
    }
    
    static func getInstance()->QuizView{
        if let quizView = instance {
            return quizView
        } else {
            instance = QuizView()
            return instance!
        }
    }
    
    public func setStatementLabel(label:UILabel){
        self.statementLabel = label
        self.statementLabel?.text = questionArray[questionCounter].statement
    }
    
    static func setView(view: UIView){
        self.view = view
    }


    public func addQuestion(statement:String,answer:Bool){
        questionArray.append(Question(statement: statement, answer: answer))
    }
    
    private func initQuestion() {
        addQuestion(statement: "Peter Prefer Coffee than Tea", answer: true)
        addQuestion(statement: "Peter Like Math than Design", answer: false)
        addQuestion(statement: "Peter Is More Programmer than Designer", answer: true)
        addQuestion(statement: "Peter Also Love Design", answer: true)
        addQuestion(statement: "Peter Like Sour Than Sweet", answer: false)
        addQuestion(statement: "Peter Like Hot Drink Than cold Drink", answer: false)
        addQuestion(statement: "Peter is Milk Then Cereal Person", answer: false)
        addQuestion(statement: "Peter Prefer Sleep Than Playing Game", answer: true)
    }
    
    public func checkAnswer(answer:Bool, layer : UIView){
        correctCounter += answer == questionArray[questionCounter].answer ? 1 : 0
        if(answer != questionArray[questionCounter].answer){
            layer.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        } else {
            layer.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        layer.alpha = 0.7
        UIView.animate(withDuration: 0.5, animations: {
            layer.alpha = 0
        })
    }
    
    public func nextQuestion(){
        questionCounter += 1
        if questionCounter<questionArray.count{
            if let label = self.statementLabel {
                label.text = questionArray[questionCounter].statement
            }
        } else {
            changeState()
        }
    }
    
    private func changeState(){
        QuizView.hide()
        FactView.show(counter: correctCounter)
        questionCounter = 0
        correctCounter = 0
        self.setStatementLabel(label: statementLabel!)
    }
    
    static func show(){
        view.isHidden = false
    }
    
    static func hide(){
        view.isHidden = true
        
    }
    
}
