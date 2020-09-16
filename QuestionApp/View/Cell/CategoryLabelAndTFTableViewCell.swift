//
//  CategoryLabelAndTFTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/07.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class CategoryLabelAndTFTableViewCell: UITableViewCell {
    
    var indexNumber: Int? //登録画面で繰り返すCellを分別する変数
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}