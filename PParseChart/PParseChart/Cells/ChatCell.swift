//
//  ChatCell.swift
//  PParseChart
//
//  Created by Scott Guidoboni on 2/2/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    

    @IBOutlet weak var bubbleView: UIView! {
        didSet {
            bubbleView.layer.cornerRadius = 16
            bubbleView.clipsToBounds = true
//            messageThing.isUserInteractionEnabled = true
            
//            messageThing.layer.zPosition = 1;
        }
    }
    @IBOutlet weak var messageThing: UILabel!
    @IBOutlet weak var usernameThing: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
