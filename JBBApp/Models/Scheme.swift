//
//  Scheme.swift
//  JBBApp
//
//  Created by Александр Филимонов on 23.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

struct Scheme {
    
//    var name: String
//    var schemeCells: [[SchemeCell]]
//    var colors: [UIColor]
//    
//    var numOfRows: Int {
//        return schemeCells.count
//    }
//    var numOfCols: Int {
//        return schemeCells[0].count
//    }
//    
//    private var nextSchemeCellId = 0
//    
//    private mutating func generateNextSchemeCellId() -> Int {
//        nextSchemeCellId += 1
//        return nextSchemeCellId
//    }
//    
//    init(name: String, colors: [UIColor], rows: [[Int]]) {
//        self.name = name
//        self.colors = colors
//        
//        var curArray = [[SchemeCell]]()
//        for row in rows {
//            var curRow = [SchemeCell]()
//            for cell in row {
//                let curCell = SchemeCell(color: colors[cell], colorNumber: cell)
//                curRow.append(curCell)
//            }
//            curArray.append(curRow)
//        }
//        self.schemeCells = curArray
//    }
//    
//    var rowsInOrder: [SchemeCell] {
//        var curRows = [[SchemeCell]]()
//        for item in schemeCells {
//            curRows.append(item.reversed())
//        }
//        
//        var orderRows = [SchemeCell]()
//        
//        for row in curRows {
//            for item in row {
//                orderRows.append(item)
//            }
//        }
//        
//        return orderRows
//    }
//    
//    var groupedRows: [(SchemeCell, Int)] {
//
//        var curRows = [[SchemeCell]]()
//        for item in schemeCells {
//            curRows.append(item.reversed())
//        }
//
//        var orderRows = [SchemeCell]()
//        
//        for row in curRows {
//            for item in row {
//                orderRows.append(item)
//            }
//        }
//
//        var retVal = [(SchemeCell, Int)]()
//
//        for item in orderRows {
//            if retVal.count == 0 {
//                retVal.append((item, 1))
//            } else if retVal[retVal.count-1].0 == item {
//                retVal[retVal.count-1].1 += 1
//            } else {
//                retVal.append((item, 1))
//            }
//        }
//
//        print("computed value groupedRows")
//        return retVal
//    }
    
}
