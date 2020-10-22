//
//  LabelAndTextViewTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

protocol LabelAndTextViewTableViewCellDelegate {
    //登録画面でTVに入力した値を取得
    func fetchQuestionsText(textField: UITextField?, date: String?, textView: UITextView?, indexNumber: Int)
}

class LabelAndTextViewTableViewCell: UITableViewCell, UITextViewDelegate {
    
    var indexNumber: Int? //セルを区別するための変数
    var delegate: LabelAndTextViewTableViewCellDelegate?
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryTextView.delegate = self
        self.selectionStyle = .none
        categoryTextViewDetail()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        delegate?.fetchQuestionsText(textField: nil, date: nil, textView: textView, indexNumber: indexNumber!)
    }
}

//MARK: - Method
extension LabelAndTextViewTableViewCell {
    private func categoryTextViewDetail() {
        // 枠の色
        categoryTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // 枠の幅
        categoryTextView.layer.borderWidth = 1.0
        // 枠を角丸にする
        categoryTextView.layer.cornerRadius = 10.0
        categoryTextView.layer.masksToBounds = true
    }
}
