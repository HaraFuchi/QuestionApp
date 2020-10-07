//
//  LabelAndTextViewTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class LabelAndTextViewTableViewCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        categoryTextView.delegate = self
        categoryTextViewDetail()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        contentView.endEditing(true)
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
