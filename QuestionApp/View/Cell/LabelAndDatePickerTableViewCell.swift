//
//  LabelAndDatePickerTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

protocol LabelAndDatePickerTableViewCellDelegate {
    //登録画面datePickerで選択した値を取得
    func fetchQuestionsText(textField: UITextField?, textView: UITextView?, date: String?, indexNumber: Int)
}

class LabelAndDatePickerTableViewCell: UITableViewCell {
    
    var indexNumber: Int? //セルを区別するための変数
    var dateString: String?
    var delegate: LabelAndDatePickerTableViewCellDelegate?
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didTapDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy年MM月dd日"
        dateString = formatter.string(from: datePicker.date)
        delegate?.fetchQuestionsText(textField: nil, textView: nil, date: dateString, indexNumber: indexNumber!)
    }
}
