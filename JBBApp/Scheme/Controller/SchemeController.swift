////
////  SchemeController.swift
////  JBBApp
////
////  Created by Александр Филимонов on 25.05.2018.
////  Copyright © 2018 Alex Filimonov. All rights reserved.
////
//
//import UIKit
//
//class SchemeController: UIViewController {
//
//    var scheme: SchemeNew?
//
//
//    @IBOutlet weak var cellsInfoTableView: UITableView!
//
//    @IBOutlet weak var scrollView: UIScrollView!
////    lazy var drawRectangle: DrawRectangle! = {
////        var VC = DrawRectangle(frame: CGRect.zero)
////        VC.scheme = scheme
////        return VC
////    }()
//
//    @IBOutlet weak var cellsScrollView: UIScrollView!
////    lazy var cells: Cells! = {
////        var VC = Cells(frame: CGRect.zero)
////        VC.scheme = scheme
////        return VC
////    }()
//
//    @objc func clickOnButton(button: UIButton) {
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        cellsInfoTableView.delegate = self
//        cellsInfoTableView.dataSource = self
//        cellsInfoTableView.rowHeight = 24.0
//
//        let button =  UIButton(type: .custom)
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
//        // button.backgroundColor = UIColor.red
//        button.setTitle("Button", for: .normal)
//        if let schemeName = scheme?.name {
//            button.setTitle(schemeName, for: .normal)
//        } else {
//            button.setTitle("No name", for: .normal)
//        }
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(self.clickOnButton), for: .touchUpInside)
//        self.navigationItem.titleView = button
//
//
//
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "TabBarColors"), style: .plain, target: nil, action: nil)
//
//        scrollView.addSubview(drawRectangle)
//        // cellsScrollView.addSubview(cells)
//
//
//        let scrollViewFrame = scrollView.frame
//        print("frame: \(scrollViewFrame)")
//        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
//        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
//        let minScale = min(scaleWidth, scaleHeight)
//        print("min scale: \(minScale)")
//        //scrollView.minimumZoomScale = minScale
//        scrollView.minimumZoomScale = 0.2
//
//        scrollView.maximumZoomScale = 1.0
//        //scrollView.zoomScale = minScale
//        scrollView.zoomScale = 0.2
//
//        scrollView.delegate = self
//    }
//
//    override func viewDidLayoutSubviews() {
//
//        drawRectangle.setNeedsDisplay()
//        let size = CGSize(width: drawRectangle.cellWidth * CGFloat(drawRectangle.colsCount), height: drawRectangle.cellHeight * CGFloat(drawRectangle.rowsCount))
//        scrollView.contentSize = size
//        drawRectangle.frame = CGRect(origin: .zero, size: size)
//
//        cells.setNeedsDisplay()
//
//        // let size2 = CGSize(width: cellsScrollView.frame.width, height: newHeight)
//        // cellsScrollView.contentSize = size
//        cells.frame = CGRect(origin: .zero, size: size)
//        cells.backgroundColor = UIColor.white
//
//    }
//
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return drawRectangle
//    }
//
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//
////        print("drawRectangle.center: \(drawRectangle.center)")
////        print("scrollView.center: \(scrollView.center)")
////
////        //        drawRectangle.center = scrollView.center
////        drawRectangle.center = CGPoint(x: 550, y: -50)
//
//        print("scrollviewdidzoom")
//    }
//}
//
//extension SchemeController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let scheme = scheme else { return 0 }
//        return scheme.groupedRows.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "infoReusableCell", for: indexPath) as? InfoCellTableView
//
////        if let cell = cell {
////            //cell.cell = scheme?.rowsInOrder[indexPath.row]
////
////            return cell
////        }
//        // print("cell: \(indexPath.row)")
//        // cell?.label.text = String(scheme!.groupedRows[indexPath.row].1)
//        // cell?.label.text = String(indexPath.row)
////        cell?.colorView.backgroundColor = scheme?.groupedRows[indexPath.row].0.color
////        cell?.colorView.layer.borderWidth = 0.5
////        cell?.colorView.layer.borderColor = UIColor.black.cgColor
//
//        return cell!
//
//    }
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let cell = cell as? InfoCellTableView
//        let curGroupedRow = scheme!.groupedRows[indexPath.row]
//
//
//        cell?.label.text = String(curGroupedRow.1)
//
////        cell?.colorView.backgroundColor = curGroupedRow.0.color
////        cell?.colorView.layer.borderWidth = 0.5
////        cell?.colorView.layer.borderColor = UIColor.black.cgColor
//
//    }
//
//
//
//
//}
//
//
//extension SchemeController: UIScrollViewDelegate {
//
//}
