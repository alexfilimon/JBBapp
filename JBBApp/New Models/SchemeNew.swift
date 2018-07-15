//
//  SchemeNew.swift
//  JBBApp
//
//  Created by Александр Филимонов on 01/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class SchemeNew {
    
    // MARK: - Properties
    
    var name: String
    var cells: [SchemeCell]
    let offset: Float
    let numberOfCellsInRow: Int
    let colors: [CustomColor]
    var curGroup: Int = 0 // position of pointer in groupedCells
    var delegate: SchemeNewDelegate?
    
    // MARK: - Lazy properties
    
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
        return retVal.reversed()
    }()
    lazy var cellsWithOffset: [(cells: [SchemeCell], offset: Float)] = {
        var curOffset: Float = offset
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
        
        return retVal.reversed()
    }()
    
    // MARK: - Computed values
    
    var cellsReady: Int {
        return cells.filter{ $0.isRead == true }.count
    }
    var progress: Float {
        return Float(cellsReady) / Float(cells.count)
    }
    
    // MARK: - Initialization and deinitialization
    
    init(with name: String, cells: [Int], numberOfCellsInRow: Int,
         colors: [UIColor], offset: Float = 0.5) {
        self.name = name
        self.offset = offset
        self.numberOfCellsInRow = numberOfCellsInRow
        
        var customColors: [CustomColor] = colors.map{ CustomColor(with: $0) }
        self.colors = customColors
        
        // init cells
        var cellsArray: [SchemeCell] = []
        for (index, cellInt) in cells.enumerated() {
            cellsArray.append(SchemeCell(color: customColors[cellInt], id: index))
        }
        self.cells = cellsArray
    }
    
    // MARK: - Internal methods
    
    func reverse() {
        setToCells(isRead: false)
        cellsWithOffset.reverse()
        groupedCells.reverse()
    }
    
    func setToCells(isRead: Bool) {
        for cell in cells {
            cell.isRead = isRead
        }
    }
    
    func getNumOfRow(cellId id: Int) -> Int? {
        for (indexRow, row) in cellsWithOffset.enumerated() {
            for cell in row.cells {
                if cell.id == id {
                    return indexRow
                }
            }
        }
        return nil
    }
    
    func changeProgress(indexOfGroupedCells: Int) {
        // проверяем на выход индекса из массива
        guard indexOfGroupedCells < groupedCells.count && indexOfGroupedCells >= 0 else { return }
        
        // ставим isRead на ячейки до indexOfGroupedCells строки
        for group in groupedCells[0..<indexOfGroupedCells] {
            for cell in group {
                cell.isRead = true
            }
        }
        
        // ставим isRead на ячейки после indexOfGroupedCells строки
        for group in groupedCells[indexOfGroupedCells...] {
            for cell in group {
                cell.isRead = false
            }
        }
        
        curGroup = indexOfGroupedCells
        delegate?.scheme(didProgressChangedTo: progress)
    }
    
}

// MARK: - Delegate protocol

protocol SchemeNewDelegate {
    func scheme(didProgressChangedTo: Float)
}
