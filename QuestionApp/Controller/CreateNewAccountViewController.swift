//
//  CreateNewAccountViewController.swift
//  QuestionApp
//
//  Created by AYANO HARA on 2020/09/07.
//  Copyright © 2020 AYANO HARA. All rights reserved.
//

import UIKit

class CreateNewAccountViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    enum CategoryList: String, CaseIterable {
        case userName = "ユーザーネーム"
        case email = "メールアドレス"
        
        var CategoryPlaceHolderList: String{
            switch self {
            case .userName: return "アプリ内で使用する名前"
            case .email: return "メールアドレス"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let categoryNib = UINib(nibName: "CategoryLabelAndTFTableViewCell", bundle: nil)
        let commonActionButtonNib = UINib(nibName: "CommonActionButtonTableViewCell", bundle: nil)
        tableView.register(categoryNib, forCellReuseIdentifier: "CategoryCell")
        tableView.register(commonActionButtonNib, forCellReuseIdentifier: "CommonActionButtonCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CategoryList.allCases.count + 1 //1は登録ボタンの分
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryLabelAndTFTableViewCell
        let commonActionButtonCell = tableView.dequeueReusableCell(withIdentifier: "CommonActionButtonCell", for: indexPath) as! CommonActionButtonTableViewCell
        
        switch indexPath.row {
        case 0:
            categoryCell.categoryLabel.text = CategoryList.userName.rawValue
            categoryCell.categoryTextField.placeholder = CategoryList.userName.CategoryPlaceHolderList
            categoryCell.indexNumber = indexPath.row
            return categoryCell
        case 1:
            categoryCell.categoryLabel.text = CategoryList.email.rawValue
            categoryCell.categoryTextField.placeholder = CategoryList.email.CategoryPlaceHolderList
            categoryCell.indexNumber = indexPath.row
            return categoryCell
        case 2:
            commonActionButtonCell.rightSideButton.setTitle("アカウントを作成", for: .normal)
            commonActionButtonCell.leftSideButton.setTitle("キャンセル", for: .normal)
            return commonActionButtonCell
        default: break
        }
        return UITableViewCell()
    }
}
