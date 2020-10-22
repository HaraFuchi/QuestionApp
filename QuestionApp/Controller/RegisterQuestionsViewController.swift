//
//  RegisterQuestionsViewController.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class RegisterQuestionsViewController: UIViewController, UITableViewDataSource, UINavigationBarDelegate {
    
    //登録したい内容の値を保持
    var personString: String?
    var contentsString: String?
    var dateString: String?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    //UINavigationBarをステータスバーまで広げる
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    @IBAction func didTapScreenRecognizer(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    enum QuestionList: String, CaseIterable{
        case person = "質問する相手"
        case question = "質問内容"
        case date = "会う予定の日"
        
        var QuestionPlaceHolderList: String {
            switch self {
            case .person: return "例)田中 太郎"
            case .question: return "例)食事制限をしないダイエット方法"
            case .date: return "例)2021/01/01"
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionList.allCases.count + 1 //1は登録ボタン(CommonActionButtonTableViewCell)の分
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryLabelAndTFTableViewCell
        let questionTextViewCell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextViewCell", for: indexPath) as! LabelAndTextViewTableViewCell
        let datePickerCell = tableView.dequeueReusableCell(withIdentifier: "LabelAndDatePickerCell", for: indexPath) as! LabelAndDatePickerTableViewCell
        let commonActionButtonCell = tableView.dequeueReusableCell(withIdentifier: "CommonActionButtonCell", for: indexPath) as! CommonActionButtonTableViewCell
        
        categoryCell.delegate = self
        questionTextViewCell.delegate = self
        datePickerCell.delegate = self
        
        switch indexPath.row {
        case 0:
            categoryCell.categoryLabel.text = QuestionList.person.rawValue
            categoryCell.categoryTextField.placeholder = QuestionList.person.QuestionPlaceHolderList
            categoryCell.indexNumber = indexPath.row
            return categoryCell
        case 1:
            questionTextViewCell.categoryLabel.text = QuestionList.question.rawValue
            questionTextViewCell.categoryTextView.text = "" //TextViewという文字が入るため
            questionTextViewCell.indexNumber = indexPath.row
            return questionTextViewCell
        case 2:
            datePickerCell.categoryLabel.text = QuestionList.date.rawValue
            datePickerCell.indexNumber = indexPath.row
            return datePickerCell
        case 3:
            commonActionButtonCell.delegate = self
            commonActionButtonCell.leftSideButton.setTitle("キャンセル", for: .normal)
            commonActionButtonCell.rightSideButton.setTitle("質問を登録", for: .normal)
            return commonActionButtonCell
        default: break
        }
        return UITableViewCell()
    }
}

//MARK: - Protocol
//ボタンを押した時のアクション
extension RegisterQuestionsViewController: CommonActionButtonTableViewCellDelegate {
    func cancelButton() {
        dismiss(animated: true, completion: nil)
    }
    func registerQuestionsButton() {
        showRegisterAlert()
    }
}

//各セルで入力された値を取得する
extension RegisterQuestionsViewController: CategoryLabelAndTFTableViewCellDelegate, LabelAndTextViewTableViewCellDelegate, LabelAndDatePickerTableViewCellDelegate {
    func fetchQuestionsText(textField: UITextField?, textView: UITextView?, date: String?, indexNumber: Int) {
        enum CategoryNameText: Int {
            case person
            case contents
            case date
        }
        
        let questionsText = CategoryNameText(rawValue: indexNumber)
        switch questionsText {
        case .person: personString = textField?.text
        case .contents: contentsString = textView?.text
        case .date: dateString = date
        case .none: break
        }
    }
}

//MARK: - Method
extension RegisterQuestionsViewController {
    func showRegisterAlert() {
        let alert = UIAlertController(title: "入力した内容を登録しますか？", message: "", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "登録する", style: .default) { _ in
            let crudModel = QuestionDataCrudModel()
            crudModel.createQuestionsData(person: self.personString ?? "???", contents: self.contentsString ?? "???", date: self.dateString ?? "???")
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
