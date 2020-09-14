//
//  CommonActionButtonTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class CommonActionButtonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
