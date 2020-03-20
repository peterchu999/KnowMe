//
//  GameViewController.swift
//  KnowMe
//
//  Created by Peter Andrew on 20/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var quiz:Quiz!
    var questionList:[Question] = []
    var correctCounter = 0
    var index = 0
    @IBOutlet weak var buttonYes: InGameButton!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var labelStatement: UILabel!
    @IBOutlet weak var buttonNo: InGameButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        questionList = quiz.questions
        setQuestion()
    }
    
    private func setQuestion(){
        labelCounter.text = "\(index+1) of \(questionList.count)"
        labelStatement.text = "\(questionList[index].question)"
    }
    
    
    @IBAction func chooseQuestion(_ sender: UIButton) {
        var choosen:Bool = true
        switch sender {
            case buttonNo:
                choosen = false
            case buttonYes:
                choosen = true
            default:
                print("Error")
        }
        correctCounter += questionList[index].answer == choosen ? 1 : 0
        if(!isDone()){
            index+=1
            setQuestion()
        } else {
            goResultPage()
        }
    }
    
    private func isDone()->Bool{
        return index >= questionList.count-1
    }
    
    private func goResultPage(){
        performSegue(withIdentifier: "seeResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "seeResult" {
                if let destination = segue.destination as? ResultPageViewController {
                    if let data = sender as? GameViewController{
                        destination.correctCounter = data.correctCounter
                        destination.totalQuestion = data.questionList.count
                    }
                }
            }
        }
    }
    
}
