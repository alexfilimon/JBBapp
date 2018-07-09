//
//  Cells.swift
//  JBBApp
//
//  Created by Александр Филимонов on 31.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

//class Cells: UIView {
//
//    var scheme: Scheme?
//
//    var linesCount: Int {
//        guard let scheme = scheme else { return 0 }
//        print("count grouped rows: \(scheme.groupedRows.count)")
//        return scheme.groupedRows.count
//    }
//
//    let width = 15.0
//    let height = 15.0
//    let margin = 4.0
//
//
//    override func draw(_ rect: CGRect) {
//        guard let scheme = scheme else { return }
//        for (index, item) in scheme.groupedRows.enumerated() {
////            drawLine(y: Double(index) * (height + margin), text: String(item.1), color: scheme.colors[item.0.colorNumber].cgColor)
//        }
//    }
//
//    // рисование ячейки
//    func drawLine(y: Double, text: String, color: CGColor) {
//        let context = UIGraphicsGetCurrentContext()
//        context?.setLineWidth(0.5)
//        context?.setStrokeColor(UIColor.black.cgColor)
//
//        let rectangle = CGRect(x: margin, y: y, width: width, height: height)
//        context?.addRect(rectangle)
//        context?.strokePath()
//        context?.setFillColor(color)
//        context?.fill(rectangle)
//
//        let str = NSAttributedString(string: text)
//        str.draw(in: CGRect(x: margin * 2 + width, y: y, width: 40.0, height: height))
//    }
//
//}
