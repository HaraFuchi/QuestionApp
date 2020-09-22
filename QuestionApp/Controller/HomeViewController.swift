//
//  HomeViewController.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/07.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sectionTitles = ["確定", "未確定"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let homeQuestionNib = UINib(nibName: "HomeQuestionTableViewCell", bundle: nil)
        tableView.register(homeQuestionNib, forCellReuseIdentifier: "HomeQuestionCell")
        self.navigationItem.hidesBackButton = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //わかりやすくするため３にしているが、本来はユーザーが登録した数のセルを返す。
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeQuestionCell = tableView.dequeueReusableCell(withIdentifier: "HomeQuestionCell", for: indexPath) as! HomeQuestionTableViewCell
        homeQuestionCell.questionTextView.isEditable = false
        return homeQuestionCell
    }
}
