//
//  DrawRectangle.swift
//  JBBApp
//
//  Created by Александр Филимонов on 25.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class DrawRectangle: UIView {

    var scheme: SchemeNew?

    // ширина и высота каждой ячейки
    var cellWidth: CGFloat {
        guard let superview = superview, let scheme = scheme else { return 0 }
        return CGFloat(superview.frame.size.width) / CGFloat(scheme.numberOfCellsInRow)
    }
    var cellHeight: CGFloat {
        return cellWidth
    }

    var rowsCount: Int {
        guard let scheme = scheme else { return 0 }
        return scheme.cellsWithOffset.count
    }
    var colsCount: Int {
        guard let scheme = scheme else { return 0 }
        return scheme.numberOfCellsInRow
    }


    override func draw(_ rect: CGRect) {
        backgroundColor(with: UIColor.white.cgColor)
        guard let scheme = scheme else { return }
        // проходим по всем строкам
        for (rowIndex, row) in scheme.cellsWithOffset.enumerated() {

            // проходим по всем ячейкам строки
            for (cellIndex, cell) in row.cells.enumerated() {

                // рисуем квадрат(ячейку)
                drawRect(x: cellWidth * CGFloat(cellIndex) + cellWidth * CGFloat(row.offset), y: cellHeight * CGFloat(rowIndex), color: cell.color.colorValue.cgColor)

            }

        }
    }
    
    // рисование ячейки
    func drawRect(x: CGFloat, y: CGFloat, color: CGColor) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(0.5)
        context?.setStrokeColor(UIColor.black.cgColor)

        let rectangle = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
        context?.addRect(rectangle)
        context?.strokePath()
        context?.setFillColor(color)
        context?.fill(rectangle)
    }
    
    func backgroundColor(with color: CGColor) {
        let context = UIGraphicsGetCurrentContext()
        
        let rectangle = CGRect(x: 0, y: 0, width: cellWidth * CGFloat(colsCount), height: cellHeight * CGFloat(rowsCount))
        context?.addRect(rectangle)
        context?.strokePath()
        context?.setFillColor(color)
        context?.fill(rectangle)
    }

}
