//
//  HomeViewController.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/07.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let homeQuestionNib = UINib(nibName: "HomeQuestionTableViewCell", bundle: nil)
        tableView.register(homeQuestionNib, forCellReuseIdentifier: "HomeQuestionCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeQuestionCell = tableView.dequeueReusableCell(withIdentifier: "HomeQuestionCell", for: indexPath) as! HomeQuestionTableViewCell
        return homeQuestionCell
    }
}
