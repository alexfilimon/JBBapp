//
//  InfoTableViewCell.swift
//  JBBApp
//
//  Created by Александр Филимонов on 11/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var readView: UIView!
    var isRead: Bool? {
        didSet {
            if let isRead = isRead {
                if isRead {
                    readView.backgroundColor = UIColor.black
                    //                readView.layer.cornerRadius = 2.5
                } else {
                    readView.backgroundColor = UIColor.red
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        colorView.layer.borderColor = UIColor.gray.cgColor
        colorView.layer.borderWidth = 0.5
        colorView.layer.cornerRadius = 3.0
        
        
    }
    
    override func draw(_ rect: CGRect) {
//        super.draw(rect)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
