//
//  ViewController.swift
//  KnowMe
//
//  Created by Peter Andrew on 05/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewFacts: UIScrollView!
    @IBOutlet weak var viewQuiz: UIView!
    @IBOutlet weak var viewStatementContainer: UIView!
    @IBOutlet weak var labelStatement: UILabel!
    @IBOutlet weak var labelCongratulation: UILabel!
    @IBOutlet weak var buttonYes: UIButton!
    @IBOutlet weak var buttonNo: UIButton!
    @IBOutlet weak var buttonPlayAgain: UIButton!
    @IBOutlet weak var viewFactContainer: UIView!
    @IBOutlet weak var imageCongratulation: UIImageView!
    @IBOutlet weak var layerView: UIView!
    var quizView:QuizView!
    var factView:FactView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize(){
        quizView = QuizView.getInstance()
        quizView.setStatementLabel(label: labelStatement)
        QuizView.setView(view: viewQuiz)
        factView = FactView(view: viewFacts, label: labelCongratulation, image:imageCongratulation)
        stylingUI()
        layerView.alpha = 0
    }
    
    private func stylingUI(){
        UICustom.roundedView(view: viewFactContainer, radius: 24)
        UICustom.roundedButton(button: buttonYes, radius: 12)
        UICustom.shadowButton(button: buttonYes, shadowOffset: CGSize(width: 0, height: 5))
        UICustom.roundedButton(button: buttonNo, radius: 12)
        UICustom.shadowButton(button: buttonNo, shadowOffset: CGSize(width: 0, height: 5))
        UICustom.roundedButton(button: buttonPlayAgain, radius: 12)
        UICustom.shadowButton(button: buttonPlayAgain, shadowOffset: CGSize(width: 0, height: 5))
    }
    
    @IBAction func chooseAnswer(_ sender: UIButton) {
        UICustom.animateFadeInOutButton(button: buttonYes, duration: 0.5)
        UICustom.animateFadeInOutButton(button: buttonNo, duration: 0.5)
        let answer = sender == buttonYes ? true : false
        quizView.checkAnswer(answer: answer, layer : layerView)
        UICustom.animateView(view: viewStatementContainer, duration: 0.5, direction: sender == buttonYes ? "left" : "right", function: quizView.nextQuestion)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        factView.changeState()
    }
}



