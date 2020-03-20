//
//  Question.swift
//  KnowMe
//
//  Created by Peter Andrew on 18/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation

class Question: NSObject,NSCoding{
    var question:String
    var answer:Bool
    
    init(_ question:String, _ answer:Bool){
        self.question = question
        self.answer = answer
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(question,forKey: "question")
        coder.encode(answer, forKey: "answer")
    }
    required convenience init(coder: NSCoder) {
        let question = coder.decodeObject(forKey: "question") as! String
        let answer = coder.decodeBool(forKey: "answer")
        self.init(question,answer)
    }
    
}
