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
        
        var retVal: [[SchemeCell]] = []

        for item in cells {
            if retVal.count == 0 {
                retVal.append([item])
            } else if retVal[retVal.count-1][0].color.colorValue == item.color.colorValue {
                retVal[retVal.count-1].append(item)
            } else {
                retVal.append([item])
            }
        }
        return retVal
    }()
    lazy var cellsWithOffset: [(cells: [SchemeCell], offset: Float)] = {
        
        var curOffset: Float = 0.0
        var retVal: [(cells: [SchemeCell], offset: Float)] = []
        
        var startIndex: Int = 0
        while(startIndex < cells.count) {
            
            var curNumOfCellsInRow: Int = numberOfCellsInRow
            if curOffset != 0.0 {
                curNumOfCellsInRow -= 1
            }
            
            var finishIndex = startIndex + curNumOfCellsInRow
            if finishIndex >= cells.count {
                finishIndex = cells.count
            }
            
            retVal.append((cells: Array(cells[startIndex..<finishIndex]), offset: curOffset))
            
            curOffset = (curOffset + offset).truncatingRemainder(dividingBy: 1.0)
            startIndex = finishIndex
        }
        
        return retVal
    }()
    let offset: Float
    let numberOfCellsInRow: Int
    let colors: [CustomColor]
    
    init(with name: String,
         cells: [Int],
         numberOfCellsInRow: Int,
         colors: [UIColor],
         offset: Float = 0.5
        ) {
        self.name = name
        self.offset = offset
        self.numberOfCellsInRow = numberOfCellsInRow
        
        // init customColors
        var customColors: [CustomColor] = []
        for color in colors {
            customColors.append(CustomColor(with: color))
        }
        self.colors = customColors
        
        // init cells
        var cellsArray: [SchemeCell] = []
        for (index, cellInt) in cells.enumerated() {
            cellsArray.append(SchemeCell(color: customColors[cellInt], id: index))
        }
        self.cells = cellsArray
        
    }
    
    
    
}
