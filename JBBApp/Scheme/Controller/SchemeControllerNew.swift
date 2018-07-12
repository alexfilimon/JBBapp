//
//  SchemeControllerNew.swift
//  JBBApp
//
//  Created by Александр Филимонов on 11/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import Foundation
import UIKit

class SchemeControllerNew: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var cellsInfoTableView: UITableView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var drawRectangle: DrawRectangle! = {
        var VC = DrawRectangle(frame: CGRect.zero)
        VC.scheme = scheme
        return VC
    }()
    
    @IBAction func changeColor(_ sender: UIButton) {
        scheme?.groupedCells[curGroup][0].isRead = true
        cellsInfoTableView.reloadData()
        curGroup = (curGroup + 1) % (scheme?.groupedCells.count)!
    }
    
    // MARK: - Vars
    
    var scheme: SchemeNew?
    var curGroup: Int = 0
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let schemeStr =
        """
        (jbb
            (version 1)
            (author "lacemaker Mary")
            (organization "")
            (notes "")
            (colors
                (rgb 255 255 255)
                (rgb 151 52 33)
                (rgb 255 99 76)
                (rgb 255 255 255))
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
                (row 2 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2)
                (row 2 2 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2)
                (row 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2)
                (row 2 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 2 2 2 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 2 2 2 2 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3)
                (row 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3)
                (row 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3)
                (row 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3)
                (row 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3)
                (row 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 2 3 3 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 3 3 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 3 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 3 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 1 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 1 1 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1)
                (row 2 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2)
                (row 2 2 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2)
                (row 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2)
                (row 2 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 2 2 2 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 2 2 2 2 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3)
                (row 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3)
                (row 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3)
                (row 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3)
                (row 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3)
                (row 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 2 3 3 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 3 3 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 3 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 3 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 1 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 1 1 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1)
                (row 2 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2)
                (row 2 2 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2)
                (row 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2)
                (row 2 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 2 2 2 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 2 2 2 2 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3)
                (row 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3)
                (row 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3)
                (row 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3)
                (row 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3)
                (row 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 2 3 3 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 3 3 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 3 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 3 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 1 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 1 1 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1)
                (row 2 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2)
                (row 2 2 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2)
                (row 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2)
                (row 2 2 2 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 2 2 2 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 2 2 2 2 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3)
                (row 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3)
                (row 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3)
                (row 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3)
                (row 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3)
                (row 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3)
                (row 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 3 3 3 3 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 3 3 3 3 2 2 2 2 1 1 1 1 2 2 2 2 2 2 2 2 2)
                (row 2 2 2 2 3 3 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 3 3 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 3 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 3 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 1 3 3 2 2 2 1 1 1 1 1 1 1 1 1 1 1)
                (row 1 1 1 1 1 1 1 1 1 3 2 2 2 2 1 1 1 1 1 1 1 1 1 1)))
        """
        let parser = JBBParser(str: schemeStr)
        scheme = SchemeNew(with: "Геометрия", cells: parser.cells, numberOfCellsInRow: parser.numberOfCellsInRow, colors: parser.colors)
        
        cellsInfoTableView.delegate = self
        cellsInfoTableView.dataSource = self
        cellsInfoTableView.rowHeight = 24.0
        
        scrollView.addSubview(drawRectangle)
        
        cellsInfoTableView.register(UINib(nibName: "InfoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "InfoIDCell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        drawRectangle.setNeedsDisplay()
        let size = CGSize(width: drawRectangle.cellWidth * CGFloat(drawRectangle.colsCount), height: drawRectangle.cellHeight * CGFloat(drawRectangle.rowsCount))
        print("size: \(size)")
        scrollView.contentSize = size
        drawRectangle.frame = CGRect(origin: .zero, size: size)
        
        
    }
    
}

extension SchemeControllerNew: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let scheme = scheme {
            return scheme.groupedCells.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoIDCell", for: indexPath) as! InfoTableViewCell
        if let scheme = scheme {
            cell.label.text = String(scheme.groupedCells[indexPath.row].count)
            cell.isRead = scheme.groupedCells[indexPath.row][0].isRead
            cell.colorView.backgroundColor =  scheme.groupedCells[indexPath.row][0].color.colorValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 23
    }
    
    
}
