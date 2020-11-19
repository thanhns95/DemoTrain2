//
//  InfoTableViewCell.swift
//  DemoTrain2
//
//  Created by Nguyễn Thành on 11/16/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var moneyLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet weak var contentViews: UIStackView!
    
    func bindData(_ data: LoanBO, isExpand: Bool) {
        contentViews.isHidden = isExpand
        nameLabel.text = data.name
        contentLabel.text = data.content
        moneyLabel.text = data.money
        timeLabel.text = data.time
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
