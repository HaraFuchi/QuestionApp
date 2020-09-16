//
//  HomeQuestionTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/16.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class HomeQuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var nextActionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
