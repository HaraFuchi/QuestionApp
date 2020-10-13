//
//  CategoryLabelAndTFTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/07.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

protocol CategoryLabelAndTFTableViewCellDelegate {
    //登録画面でTFに入力した値を取得
    func fetchQuestionsText(textField: UITextField?, textView: UITextView?, date: String?, indexNumber: Int)
}

class CategoryLabelAndTFTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var indexNumber: Int? //登録画面で繰り返すCellを分別する変数
    var delegate: CategoryLabelAndTFTableViewCellDelegate?
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        categoryTextField.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.fetchQuestionsText(textField: textField, textView: nil, date: nil, indexNumber: indexNumber!)
    }
}
