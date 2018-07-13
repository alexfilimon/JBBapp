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
                    guard let color = color else { return }
                    if color.isLight()! {
                        readView.backgroundColor = UIColor.black
                    } else {
                        readView.backgroundColor = UIColor.white
                    }
                } else {
                    readView.backgroundColor = UIColor.clear
                }
            }
        }
    }
    var color: UIColor? {
        didSet {
//            guard let color = color else { return }
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
