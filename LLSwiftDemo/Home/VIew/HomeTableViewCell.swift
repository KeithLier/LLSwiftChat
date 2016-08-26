//
//  homeTableViewCell.swift
//  LLSwiftDemo
//
//  Created by Keith on 16/8/3.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var detail : UILabel!
    @IBOutlet weak var time : UILabel!
    @IBOutlet weak var imgView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgView.clipsToBounds = true
        self.imgView.layer.cornerRadius = 5;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
