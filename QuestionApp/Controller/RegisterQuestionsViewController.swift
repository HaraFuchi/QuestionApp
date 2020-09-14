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
    
    enum QuestionList: String, CaseIterable{
        case person = "質問する相手"
        case question = "質問内容"
        case date = "会う予定の日"
        case nextAction = "次のアクション"
        
        var QuestionPlaceHolderList: String {
            switch self {
            case .person: return "例)田中 太郎"
            case .question: return "例)食事制限をしないダイエット方法"
            case .date: return "例)2021/01/01"
            case .nextAction: return "例)教えてもらったダイエット方法を１ヶ月続ける"
            }
        }
    }
    
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
        let datePickerCell = tableView.dequeueReusableCell(withIdentifier: "LabelAndDatePickerCell", for: indexPath) as! LabelAndDatePickerTableViewCell
        
        switch indexPath.row {
        case 0:
            questionTextViewCell.categoryLabel.text = QuestionList.person.rawValue
            //placeholder
            return questionTextViewCell //後からCategoryCellに修正(Label&TF)
        case 1:
            questionTextViewCell.categoryLabel.text = QuestionList.question.rawValue
            return questionTextViewCell
        case 2:
            datePickerCell.categoryLabel.text = QuestionList.date.rawValue
            return datePickerCell
        case 3:
            questionTextViewCell.categoryLabel.text = QuestionList.nextAction.rawValue
            //placeHolder
            return questionTextViewCell //後からCategoryCellに修正(Label&TF)
        case 4:
            return UITableViewCell() //後からCommonActionButtonCellに修正(Button)
        default: break
        }
        return UITableViewCell()
    }
}
