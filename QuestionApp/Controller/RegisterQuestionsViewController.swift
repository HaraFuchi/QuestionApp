//
//  RegisterQuestionsViewController.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class RegisterQuestionsViewController: UIViewController, UITableViewDataSource, UINavigationBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    //UINavigationBarをステータスバーまで広げる
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
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
        navigationBar.delegate = self
        let categoryNib = UINib(nibName: "CategoryLabelAndTFTableViewCell", bundle: nil)
        let questionTextViewNib = UINib(nibName: "LabelAndTextViewTableViewCell", bundle: nil)
        let datePickerNib = UINib(nibName: "LabelAndDatePickerTableViewCell", bundle: nil)
        let commonActionButtonNib = UINib(nibName: "CommonActionButtonTableViewCell", bundle: nil)
        tableView.register(categoryNib, forCellReuseIdentifier: "CategoryCell")
        tableView.register(questionTextViewNib, forCellReuseIdentifier: "LabelAndTextViewCell")
        tableView.register(datePickerNib, forCellReuseIdentifier: "LabelAndDatePickerCell")
        tableView.register(commonActionButtonNib, forCellReuseIdentifier: "CommonActionButtonCell")
        //このブランチをマージした後にカスタムセルのCategoryLabelAndTFTableviewCellとCommonActionButtonTableViewCellを追加
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //マジックナンバーは使わないようあとで修正
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryLabelAndTFTableViewCell
        let questionTextViewCell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextViewCell", for: indexPath) as! LabelAndTextViewTableViewCell
        let datePickerCell = tableView.dequeueReusableCell(withIdentifier: "LabelAndDatePickerCell", for: indexPath) as! LabelAndDatePickerTableViewCell
        let commonActionButtonCell = tableView.dequeueReusableCell(withIdentifier: "CommonActionButtonCell", for: indexPath) as! CommonActionButtonTableViewCell
        
        switch indexPath.row {
        case 0:
            categoryCell.categoryLabel.text = QuestionList.person.rawValue
            categoryCell.categoryTextField.placeholder = QuestionList.person.QuestionPlaceHolderList
            //placeholder
            return categoryCell //後からCategoryCellに修正(Label&TF)
        case 1:
            questionTextViewCell.categoryLabel.text = QuestionList.question.rawValue
            questionTextViewCell.categoryTextView.text = "" //TextViewという文字が入るため
            return questionTextViewCell
        case 2:
            datePickerCell.categoryLabel.text = QuestionList.date.rawValue
            return datePickerCell
        case 3:
            categoryCell.categoryLabel.text = QuestionList.nextAction.rawValue
            categoryCell.categoryTextField.placeholder = QuestionList.nextAction.QuestionPlaceHolderList
            //placeHolder
            return categoryCell //後からCategoryCellに修正(Label&TF)
        case 4:
            commonActionButtonCell.leftSideButton.setTitle("キャンセル", for: .normal)
            commonActionButtonCell.rightSideButton.setTitle("質問を登録", for: .normal)
            return commonActionButtonCell //後からCommonActionButtonCellに修正(Button)
        default: break
        }
        return UITableViewCell()
    }
}
