//
//  SchemeNew.swift
//  JBBApp
//
//  Created by Александр Филимонов on 01/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class SchemeNew {
    
    var name: String
    var cells: [SchemeCell]
    lazy var groupedCells: [[SchemeCell]] = {
        
        
        
        return []
    }()
    lazy var cellsWithOffset: [(cells: SchemeCell, offset: Float)] = {
        
        
        
        return []
    }()
    let offset: Float
    // let colors: [CustomColor]
    
    init(with name: String,
         cells: [Int],
         colors: [UIColor],
         offset: Float = 0.5
        ) {
        self.name = name
        self.offset = offset
        
        // init customColors
        var customColors: [CustomColor] = []
        for color in colors {
            customColors.append(CustomColor(with: color))
        }
        
        // init cells
        var cellsArray: [SchemeCell] = []
        for (index, cellInt) in cells.enumerated() {
            cellsArray.append(SchemeCell(color: customColors[cellInt], id: index))
        }
        self.cells = cellsArray
        
    }
    
    
    
}
