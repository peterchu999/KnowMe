//
//  DataStore.swift
//  KnowMe
//
//  Created by Peter Andrew on 18/03/20.
//  Copyright © 2020 Peter Andrew. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataStore {
    static var instance:DataStore!
    var quiz:Quiz!
    
    var quizDic:[String:Quiz]!
    public static func getInstance()->DataStore{
        if let instance = self.instance{
            return instance
        } else {
            self.instance = DataStore()
            return instance!
        }
    }
    init(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fetchData = NSFetchRequest<NSManagedObject>(entityName: "QuizDB")
        
        do {
          let data = try manageContext.fetch(fetchData)
            for date in data{
                print(date.value(forKey: "key")!)
            }
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let manageContext = appDelegate.persistentContainer.viewContext
            
            let entityQuiz = NSEntityDescription.entity(forEntityName: "QuizDB", in: manageContext)!
            let quizDB = NSManagedObject(entity: entityQuiz, insertInto: manageContext)
            quizDB.setValue(quiz.key, forKey: "key")
            
            do {
              try manageContext.save()
            } catch let error as NSError {
              print("Could not save. \(error), \(error.userInfo)")
            }
            self.quiz = quiz
//            self.quizDic.updateValue(quiz, forKey: quiz.key)
        }
        
    
}
    

