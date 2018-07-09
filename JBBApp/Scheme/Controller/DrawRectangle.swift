//
//  DrawRectangle.swift
//  JBBApp
//
//  Created by Александр Филимонов on 25.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

//class DrawRectangle: UIView {
//
//    var scheme: Scheme?
//
//    // ширина и высота каждой ячейки
//    var cellWidth: CGFloat {
//        guard let superview = superview, let scheme = scheme else { return 0 }
//        return CGFloat(superview.frame.size.width) / CGFloat(scheme.numOfCols)
//    }
//    var cellHeight: CGFloat {
//        guard let superview = superview, let scheme = scheme else { return 0 }
//        return CGFloat(superview.frame.size.width) / CGFloat(scheme.numOfCols)
//    }
//
//    var rowsCount: Int {
//        guard let scheme = scheme else { return 0 }
//        return scheme.numOfRows
//    }
//    var colsCount: Int {
//        guard let scheme = scheme else { return 0 }
//        return scheme.numOfCols
//    }
//
//
//    override func draw(_ rect: CGRect) {
//        guard let scheme = scheme else { return }
//        // проходим по всем строкам
//        for (ri, row) in scheme.schemeCells.enumerated() {
//
//            // проходим по всем ячейкам строки
//            for (ii, item) in row.enumerated() {
//
//                // рисуем квадрат(ячейку)
////                drawRect(x: cellWidth * CGFloat(ii), y: cellHeight * CGFloat(ri), color: scheme.colors[item.colorNumber].cgColor)
//
//            }
//
//        }
//
//    }
//    
//    // рисование ячейки
//    func drawRect(x: CGFloat, y: CGFloat, color: CGColor) {
//        let context = UIGraphicsGetCurrentContext()
//        context?.setLineWidth(0.5)
//        context?.setStrokeColor(UIColor.black.cgColor)
//
//        let rectangle = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
//        context?.addRect(rectangle)
//        context?.strokePath()
//        context?.setFillColor(color)
//        context?.fill(rectangle)
//    }
//
//}
