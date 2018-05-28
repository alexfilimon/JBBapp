//
//  DrawRectangle.swift
//  JBBApp
//
//  Created by Александр Филимонов on 25.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class DrawRectangle: UIView {
    
    let schemeStr =
    """
    (jbb
    (version 1)
    (author "lacemaker Mary")
    (organization "")
    (notes "")
    (colors
        (rgb 255 255 255)
        (rgb 0 0 0)
        (rgb 255 0 0)
        (rgb 0 255 0)
        (rgb 0 0 255)
        (rgb 255 255 0)
        (rgb 255 115 0)
        (rgb 0 128 255)
        (rgb 0 64 0)
        (rgb 128 0 0))
    (view
        (draft-visible true)
        (corrected-visible true)
        (simulation-visible true)
        (report-visible true)
        (selected-tool "pencil")
        (selected-color 1)
        (zoom 2)
        (scroll 0)
        (shift 0)
        (draw-colors true)
        (draw-symbols false)
        (symbols "·abcdefghijklmnopqrstuvwxyz+-/\\*"))
    (model
        (row 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)
        (row 2 2 2 2 1 8 8 8 8 8 1 4 4 4 4 4 4 4 4 4 4 4 4 1)
        (row 2 2 2 2 1 8 8 8 8 8 8 1 4 4 4 4 4 4 4 4 4 4 4 1)
        (row 2 2 2 2 1 8 8 8 8 8 8 8 1 4 4 4 4 4 4 4 4 4 4 1)
        (row 2 2 2 2 1 8 8 8 8 8 8 8 8 1 4 4 4 4 4 4 4 4 4 1)
        (row 2 2 2 2 1 8 8 8 8 8 8 8 8 8 1 4 4 4 4 4 4 4 4 1)
        (row 2 2 2 2 1 8 8 8 8 8 8 8 8 8 8 1 4 4 4 4 4 4 4 1)
        (row 1 1 1 1 1 8 8 8 8 8 8 8 8 8 8 1 1 4 4 4 4 4 4 1)
        (row 5 5 5 5 1 8 8 8 8 8 8 8 8 8 8 1 9 1 4 4 4 4 4 1)
        (row 5 5 5 5 5 1 8 8 8 8 8 8 8 8 8 1 9 9 1 4 4 4 4 1)
        (row 5 5 5 5 5 5 1 8 8 8 8 8 8 8 8 1 9 9 9 1 4 4 4 1)
        (row 5 5 5 5 5 5 5 1 8 8 8 8 8 8 8 1 9 9 9 9 1 4 4 1)
        (row 5 5 5 5 5 5 5 5 1 8 8 8 8 8 8 1 9 9 9 9 9 1 4 1)
        (row 5 5 5 5 5 5 5 5 1 1 8 8 8 8 8 1 9 9 9 9 9 9 1 1)
        (row 5 5 5 5 5 5 5 5 1 6 1 8 8 8 8 1 9 9 9 9 9 9 9 1)
        (row 5 5 5 5 5 5 5 5 1 6 6 1 8 8 8 1 9 9 9 9 9 9 9 1)
        (row 1 1 1 1 5 5 5 5 1 6 6 6 1 8 8 1 9 9 9 9 9 9 9 1)
        (row 7 7 7 7 1 1 5 5 1 6 6 6 6 1 8 1 9 9 9 9 9 9 9 1)
        (row 7 7 7 7 7 1 1 5 1 6 6 6 6 6 1 1 9 9 9 9 9 9 9 1)
        (row 7 7 7 7 7 7 1 5 1 6 6 6 6 6 6 6 1 9 9 9 9 9 9 1)
        (row 7 7 7 7 7 7 7 1 1 6 6 6 6 6 6 6 6 1 9 9 9 9 9 1)
        (row 7 7 7 7 7 7 7 7 1 6 6 6 6 6 6 6 6 6 1 9 9 9 9 1)
        (row 7 7 7 7 1 1 1 1 1 6 6 6 6 6 6 6 6 6 6 1 9 9 9 1)
        (row 7 7 7 7 1 3 3 3 1 6 6 6 6 6 6 6 6 6 6 6 1 9 9 1)
        (row 7 7 7 7 1 3 3 3 1 6 6 6 6 6 6 6 6 6 6 6 6 1 9 1)
        (row 7 7 7 7 1 3 3 3 1 6 6 6 6 6 6 6 6 6 6 6 6 6 1 1)
        (row 7 7 7 7 1 3 3 3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)
        (row 7 7 7 7 1 3 3 3 3 3 1 4 4 4 1 2 2 2 2 2 1 7 7 7)
        (row 7 7 7 7 1 3 3 3 3 3 1 4 4 4 1 2 2 2 2 2 1 1 7 7)
        (row 7 7 7 7 1 3 3 3 3 3 1 4 4 4 1 2 2 2 2 2 1 5 1 7)
        (row 7 7 7 7 1 3 3 3 3 3 1 4 4 4 1 2 2 2 2 2 1 5 5 1)
        (row 1 1 1 1 1 1 1 1 1 1 1 4 4 4 1 2 2 2 2 2 1 5 5 5)
        (row 5 5 5 1 4 4 4 4 4 4 4 4 4 4 1 2 2 2 2 2 1 5 5 5)
        (row 5 5 5 1 4 4 4 4 4 4 4 4 4 4 1 1 1 1 1 1 1 5 5 5)
        (row 5 5 5 5 1 4 4 4 4 4 4 4 4 4 4 4 1 8 8 8 1 5 5 5)
        (row 5 5 5 5 1 4 4 4 4 4 4 4 4 4 4 4 1 8 8 8 1 5 5 5)
        (row 5 5 5 5 1 4 4 4 4 4 4 4 4 4 4 4 1 8 8 8 1 5 5 5)
        (row 5 5 5 5 1 4 4 4 4 4 4 4 4 4 4 4 1 8 8 8 1 5 5 5)
        (row 5 5 5 5 1 4 4 4 4 4 4 4 4 4 4 4 4 1 8 8 1 5 5 5)
        (row 5 5 5 5 5 1 4 4 4 4 4 4 4 4 4 4 4 1 8 8 1 5 5 5)
        (row 5 5 5 5 5 1 4 4 4 4 4 4 4 4 4 4 4 1 8 8 1 5 5 5)
        (row 5 5 5 5 5 1 4 4 4 4 4 4 4 4 4 4 4 1 8 8 1 5 5 5)
        (row 5 5 5 5 5 5 1 1 1 1 1 1 1 1 1 1 1 1 8 8 1 5 5 5)
        (row 5 5 5 5 5 5 1 9 9 9 9 9 9 1 8 8 8 8 8 8 1 5 5 5)
        (row 5 5 5 5 5 5 1 9 9 9 9 9 9 1 8 8 8 8 8 8 1 5 5 5)
        (row 5 5 5 5 5 5 1 9 9 9 9 9 9 1 8 8 8 8 8 8 1 5 5 5)
        (row 5 5 5 5 5 5 5 1 9 9 9 9 9 1 8 8 8 8 8 8 1 1 1 1)
        (row 5 5 5 5 5 5 5 1 9 9 9 9 9 1 8 8 8 8 8 8 8 8 8 1)
        (row 1 1 1 1 1 1 1 1 9 9 9 9 9 1 8 8 8 8 8 8 8 8 8 8)
        (row 1 7 7 7 7 7 1 9 9 9 9 9 9 1 8 8 8 8 8 8 8 8 8 8)
        (row 1 7 7 7 7 7 1 9 9 9 9 9 9 1 8 8 8 8 8 8 8 8 8 8)
        (row 8 1 7 7 7 7 1 9 9 9 9 9 9 1 8 8 8 8 8 8 8 8 8 8)
        (row 8 8 1 7 7 7 1 9 9 9 9 9 9 1 8 8 8 8 8 8 8 8 8 8)
        (row 8 8 8 1 7 7 7 1 9 9 9 9 9 1 8 8 8 8 8 8 8 8 8 8)
        (row 8 8 8 8 1 7 7 1 1 9 9 9 9 1 8 8 8 8 8 8 8 8 8 8)
        (row 8 8 8 8 1 7 7 1 6 1 9 9 9 9 1 8 8 8 8 8 8 8 8 8)
        (row 8 8 8 8 1 7 7 7 1 6 1 9 9 9 9 1 8 8 8 8 8 8 8 8)
        (row 8 8 8 8 1 7 7 7 7 1 6 1 9 9 9 9 1 8 8 8 8 8 8 8)
        (row 8 8 8 8 1 1 1 1 1 1 1 6 1 9 9 9 9 1 1 1 1 1 1 1)
        (row 8 8 8 8 1 6 6 6 6 6 6 6 6 1 9 9 9 9 9 9 9 9 9 1)
        (row 1 1 1 1 1 6 6 6 6 6 6 6 6 1 1 9 9 9 9 9 9 9 9 1)
        (row 2 2 2 2 1 6 6 6 6 6 6 6 6 1 2 1 9 9 9 9 9 9 9 1)
        (row 2 2 2 2 1 6 6 6 6 6 6 6 6 1 2 2 1 9 9 9 9 9 9 1)
        (row 2 2 2 2 1 6 6 6 6 6 6 6 6 1 2 2 2 1 9 9 9 9 9 1)))


    """
    
    private lazy var parser = JBBParser(str: self.schemeStr)
    lazy var scheme = Scheme(name: self.parser.name ?? "no name", colors: parser.colors, rows: parser.rows)
    
    var cellWidth: CGFloat = 1.0
    var cellHeight: CGFloat = 1.0
    
    
    override func draw(_ rect: CGRect) {
        
        cellWidth = CGFloat(self.frame.size.width) / CGFloat(scheme.rows[0].count)
        cellHeight = cellWidth
        
        
        for (ri, row) in scheme.rows.enumerated() {
            
            for (ii, item) in row.enumerated() {
                
                drawRect(x: cellWidth * CGFloat(ii), y: cellHeight * CGFloat(ri), color: scheme.colors[item].cgColor)
                
            }
            
        }
        
        self.heightAnchor.constraint(equalToConstant: cellHeight * CGFloat(scheme.rows.count))
        
        print(scheme.colors)
        
    }
    
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
    
}
