//
//  LabelAndDatePickerTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class LabelAndDatePickerTableViewCell: UITableViewCell {
    
    var indexNumber: Int? //セルを区別するための変数
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
