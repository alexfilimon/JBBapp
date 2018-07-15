//
//  SchemeCell.swift
//  JBBApp
//
//  Created by Александр Филимонов on 31.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class SchemeCell {
    
    // MARK: - Properties
    
    let color: CustomColor
    var isRead = false
    let id: Int
    
    // MARK: - Init and Deinit
    
    init(color: CustomColor, id: Int) {
        self.color = color
        self.id = id
    }
    
}

// MARK: - Equatable

extension SchemeCell: Equatable {
    static func == (lhs: SchemeCell, rhs: SchemeCell) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - CustomStringConvertible

extension SchemeCell: CustomStringConvertible {
    var description: String {
        return "\(color.defaultName!)"
    }
}
