//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Samuel Kim on 5/24/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    // Nib is the old name for XIB (zib) file
    // which is a UI spec file
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // similar to viewDidLoad of the message
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    @IBOutlet var messageBubble: UIView!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var rightImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
