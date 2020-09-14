//
//  RegisterQuestionsViewController.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class RegisterQuestionsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let questionTextViewNib = UINib(nibName: "LabelAndTextViewTableViewCell", bundle: nil)
        let datePickerNib = UINib(nibName: "LabelAndDatePickerTableViewCell", bundle: nil)
        tableView.register(questionTextViewNib, forCellReuseIdentifier: "LabelAndTextViewCell")
        tableView.register(datePickerNib, forCellReuseIdentifier: "LabelAndDatePickerCell")
        //このブランチをマージした後にカスタムセルのCategoryLabelAndTFTableviewCellとCommonActionButtonTableViewCellを追加
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //マジックナンバーは使わないようあとで修正
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let questionTextViewCell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextViewCell", for: indexPath) as! LabelAndTextViewTableViewCell
        let datePickerCell = tableView.dequeueReusableCell(withIdentifier: "LabelAndDatePickerCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            return questionTextViewCell //後からCategoryCellに修正(Label&TF)
        case 1:
            return questionTextViewCell
        case 3:
            return datePickerCell
        case 4:
            return questionTextViewCell //後からCategoryCellに修正(Label&TF)
        case 5:
            return UITableViewCell() //後からCommonActionButtonCellに修正(Button)
        default: break
        }
        return UITableViewCell()
    }
}
