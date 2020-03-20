//
//  Quiz.swift
//  KnowMe
//
//  Created by Peter Andrew on 18/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation

class Quiz :NSObject, NSCoding {
    
    var questions:[Question]
    var key:String
    init(_ question:[Question], _ key:String){
        self.questions = question
        self.key = key
    }
    func encode(with coder: NSCoder) {
        coder.encode(questions, forKey: "question")
        coder.encode(key, forKey: "keyValue")
    }
    
    required convenience init?(coder: NSCoder) {
        let question = coder.decodeObject(forKey: "question") as! [Question]
        let key = coder.decodeObject(forKey: "keyValue") as! String
        self.init(question,key)
    }
}
