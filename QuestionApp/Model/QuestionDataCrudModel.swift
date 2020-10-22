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
    
    func createQuestionsData(person: String, contents: String, date: String) {
        let createDataDict = ["質問相手": person, "質問内容": contents, "日付": date]
        ref.child(Auth.auth().currentUser!.uid).childByAutoId().setValue(createDataDict)
    }
}
