//
//  AnonymousLoginModel.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/27.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import Foundation
import Firebase

class AnonymousLoginModel {
    func anonymousLogin() {
        Auth.auth().signInAnonymously() { (authResult, error) in
            if let error = error {
                print("Auth Error :\(error.localizedDescription)")
            }
            guard let user = authResult?.user else { return }
            _ = user.isAnonymous  // true
            _ = user.uid
            return
        }
    }
}
