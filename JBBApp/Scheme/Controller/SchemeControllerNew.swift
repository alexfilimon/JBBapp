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
        for item in (scheme?.groupedCells[curGroup])! {
            item.isRead = true
        }
//        scheme?.groupedCells[curGroup][0].isRead = true
        cellsInfoTableView.reloadData()
        drawRectangle.setNeedsDisplay()
        curGroup = (curGroup + 1) % (scheme?.groupedCells.count)!
    }
    
    // MARK: - Vars
    
    var scheme: SchemeNew?
    var curGroup: Int = 0
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
