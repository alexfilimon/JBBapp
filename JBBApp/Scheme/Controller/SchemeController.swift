//
//  SchemeController.swift
//  JBBApp
//
//  Created by Александр Филимонов on 25.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class SchemeController: UIViewController {

    var scheme: Scheme?
    
    @IBOutlet weak var scrollView: UIScrollView!
    lazy var drawRectangle: DrawRectangle! = {
        var VC = DrawRectangle(frame: CGRect.zero)
        VC.scheme = scheme
        return VC
    }()
    
    @IBOutlet weak var cellsScrollView: UIScrollView!
    lazy var cells: Cells! = {
        var VC = Cells(frame: CGRect.zero)
        VC.scheme = scheme
        return VC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let schemeName = scheme?.name {
            self.navigationItem.title = schemeName
        }
        
        // print("groupedRows: \(String(describing: scheme?.groupedRows))")
        
        scrollView.addSubview(drawRectangle)
        cellsScrollView.addSubview(cells)
    }
    
    override func viewDidLayoutSubviews() {
        
        drawRectangle.setNeedsDisplay()
        let size = CGSize(width: drawRectangle.cellWidth * CGFloat(drawRectangle.colsCount), height: drawRectangle.cellHeight * CGFloat(drawRectangle.rowsCount))
        scrollView.contentSize = size
        drawRectangle.frame = CGRect(origin: .zero, size: size)
        
        cells.setNeedsDisplay()
        
        var newHeight = CGFloat(Double(cells.linesCount) * (cells.margin + cells.height))
        print("large height: \(newHeight)")
        if newHeight > 4000 {
            newHeight = 4000
        }
        
        let size2 = CGSize(width: cellsScrollView.frame.width, height: newHeight)
        cellsScrollView.contentSize = size2
        cells.frame = CGRect(origin: .zero, size: size2)
        cells.backgroundColor = UIColor.white
        
    }
}
