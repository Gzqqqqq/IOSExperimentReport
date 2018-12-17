//
//  StudentTableViewCell.swift
//  testProject
//
//  Created by Guozhouqian on 2018/11/1.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var stuNum: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
