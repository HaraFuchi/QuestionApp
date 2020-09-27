//
//  ViewController.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/08/28.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit
import Firebase

class SignUpWaysViewController: UIViewController {
    
    let anonymousLoginModel = AnonymousLoginModel()
    
    @IBOutlet weak var anonymousSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapAnonymousSignUpButton(_ sender: UIButton) {
        anonymousLoginModel.anonymousLogin()
        //ユーザーのログイン状況に変更が加わった際に実行されるメソッド
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let _ = user {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

