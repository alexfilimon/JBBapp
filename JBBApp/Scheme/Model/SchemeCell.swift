//
//  SchemeCell.swift
//  JBBApp
//
//  Created by Александр Филимонов on 31.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class SchemeCell {
    
    let color: UIColor
    let colorNumber: Int
    var isRead = false
    
    init(color: UIColor, colorNumber: Int) {
        self.color = color
        self.colorNumber = colorNumber
    }
    
}

extension SchemeCell: Equatable {
    static func == (lhs: SchemeCell, rhs: SchemeCell) -> Bool {
        return lhs.color == rhs.color
    }
}

extension SchemeCell: CustomStringConvertible {
    var description: String {
        return "\(colorNumber)"
    }
}
