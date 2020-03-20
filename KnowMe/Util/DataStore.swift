//
//  DataStore.swift
//  KnowMe
//
//  Created by Peter Andrew on 18/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit

class DataStore {
    static var instance:DataStore!
    var quiz:Quiz!
    public static func getInstance()->DataStore{
        if let instance = self.instance{
            return instance
        } else {
            self.instance = DataStore()
            return instance!
        }
    }
    
    public func getQuiz()->Quiz?{
        if let quiz = self.quiz{
            return quiz
        } else {
            return nil
        }
    }
    
    public func setQuiz(_ quiz: Quiz){
        self.quiz = quiz
    }
}
    

