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
    
    
//    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Vars
    
    var scheme: SchemeNew?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellsInfoTableView.delegate = self
        cellsInfoTableView.dataSource = self
        cellsInfoTableView.rowHeight = 24.0
        
//        cellsInfoTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        cellsInfoTableView.register(UINib(nibName: "InfoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "InfoIDCell")
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
            cell.colorView.backgroundColor = scheme.groupedCells[indexPath.row][0].color.colorValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 23
    }
    
    
}
