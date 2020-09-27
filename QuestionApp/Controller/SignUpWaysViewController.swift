//
//  ViewController.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/08/28.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class SignUpWaysViewController: UIViewController {
    
    let anonymousLoginModel = AnonymousLoginModel()

    @IBOutlet weak var anonymousSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapAnonymousSignUpButton(_ sender: UIButton) {
        anonymousLoginModel.anonymousLogin()
    }
}

