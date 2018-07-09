//
//  SchemeCell.swift
//  JBBApp
//
//  Created by Александр Филимонов on 31.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class SchemeCell {
    
    let color: CustomColor
    // let colorNumber: Int
    var isRead = false
    let id: Int
    
    init(color: CustomColor, id: Int) {
        self.color = color
        self.id = id
    }
    
}

extension SchemeCell: Equatable {
    static func == (lhs: SchemeCell, rhs: SchemeCell) -> Bool {
        return lhs.color.colorValue == rhs.color.colorValue
    }
}

extension SchemeCell: CustomStringConvertible {
    var description: String {
        return "\(color.defaultName)"
    }
}
