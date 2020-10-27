//
//  QuestionDataCrudModel.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/10/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import Foundation
import Firebase

class QuestionDataCrudModel {
    
    let ref = Database.database().reference()
    
    func createQuestionsData(person: String, date: String, contents: String) {
        let createDataDict = ["質問相手": person, "日付": date, "質問内容": contents]
        ref.child(Auth.auth().currentUser!.uid).childByAutoId().setValue(createDataDict)
    }
}
