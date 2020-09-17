//
//  CommonActionButtonTableViewCell.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/14.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

protocol CommonActionButtonTableViewCellDelegate {
    func cancelButton()
    func registerQuestionsButton()
}

class CommonActionButtonTableViewCell: UITableViewCell {
    
    var delegate: CommonActionButtonTableViewCellDelegate?
    
    @IBOutlet weak var rightSideButton: UIButton!
    @IBOutlet weak var leftSideButton: UIButton!
    
    @IBAction func didTapLeftSideButton(_ sender: UIButton) {
        delegate?.cancelButton()
    }
    @IBAction func didTapRightSideButton(_ sender: UIButton) {
        delegate?.registerQuestionsButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
