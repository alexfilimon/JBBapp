//
//  ViewController.swift
//  JBBApp
//
//  Created by Александр Филимонов on 23.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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

//    let schemeStr =
//    """
//    (jbb
//    (version 1)
//    (author "lacemaker Mary")
//    (organization "")
//    (notes "")
//    (colors
//        (rgb 255 255 255)
//        (rgb 12 12 11)
//        (rgb 250 245 245)
//        (rgb 41 160 41)
//        (rgb 0 0 255)
//        (rgb 252 223 5)
//        (rgb 255 128 0)
//        (rgb 0 255 255)
//        (rgb 26 134 127)
//        (rgb 238 15 40)
//        (rgb 255 238 0))
//    (view
//        (draft-visible true)
//        (corrected-visible true)
//        (simulation-visible true)
//        (report-visible true)
//        (selected-tool "pencil")
//        (selected-color 1)
//        (zoom 2)
//        (scroll 0)
//        (shift 0)
//        (draw-colors true)
//        (draw-symbols false)
//        (symbols "·abcdefghijklmnopqrstuvwxyz+-/\\*"))
//    (model
//        (row 1 10 9 10 1 1 1 1 1 1 1 10 10 1 1)
//        (row 1 1 10 10 1 1 1 1 1 1 1 10 9 10 1)
//        (row 1 1 1 1 1 1 1 1 1 1 1 1 10 10 1)
//        (row 3 3 3 1 1 1 1 1 9 1 9 1 1 1 1)
//        (row 3 1 1 3 1 1 1 1 9 6 5 9 1 1 1)
//        (row 3 1 3 1 3 1 9 9 9 6 5 5 9 9 9)
//        (row 1 3 3 1 3 1 1 5 5 9 6 5 9 6 6)
//        (row 1 1 1 1 3 1 9 6 5 5 9 9 9 6 5)
//        (row 5 9 1 1 3 1 1 9 6 6 9 10 10 9 5)
//        (row 5 9 1 1 3 1 1 1 9 9 9 10 9 10 9)
//        (row 9 9 1 1 3 1 1 1 9 5 5 9 10 10 9)
//        (row 6 6 9 1 3 1 3 1 9 5 5 6 9 9 9)
//        (row 5 5 6 9 1 3 3 1 1 1 6 6 9 5 6)
//        (row 9 5 5 1 1 1 1 1 1 1 9 9 9 5 5)
//        (row 6 9 9 9 1 1 1 1 10 10 1 1 1 9 5)
//        (row 6 9 1 1 1 1 1 1 10 9 10 1 1 1 9)
//        (row 1 9 1 1 1 3 3 1 1 10 10 1 3 1 1)
//        (row 1 1 1 3 1 3 1 3 1 1 1 1 3 3 1)
//        (row 1 10 1 1 3 1 1 3 1 1 1 1 3 1 3)
//        (row 1 9 6 1 1 3 3 3 1 1 1 1 3 1 3)
//        (row 1 9 9 6 1 5 1 3 1 1 3 3 1 3 1)
//        (row 3 1 9 6 1 9 6 1 3 1 3 1 3 1 3)
//        (row 1 3 3 3 1 9 9 6 1 3 1 3 1 1 3)
//        (row 1 1 1 1 1 1 9 6 1 3 1 1 3 3 3)
//        (row 1 10 10 1 10 6 6 3 3 3 1 1 1 1 1)
//        (row 1 10 9 10 1 9 9 6 1 1 1 10 10 1 1)
//        (row 1 1 10 10 1 1 9 9 1 1 1 10 9 10 1)
//        (row 1 1 1 1 1 1 1 1 1 1 1 1 10 10 1)
//        (row 3 3 3 1 1 1 1 1 9 9 9 1 1 1 1)
//        (row 3 1 1 3 1 1 1 1 9 5 5 9 1 1 1)
//        (row 3 1 3 1 3 1 9 9 9 5 6 5 9 9 9)
//        (row 1 3 3 1 3 1 9 5 5 9 6 6 9 5 5)
//        (row 9 1 1 1 3 1 9 5 6 6 9 6 9 6 6)
//        (row 5 9 1 1 3 1 1 9 5 6 6 9 9 6 6)
//        (row 5 9 1 1 3 1 1 1 9 9 9 9 5 9 9)
//        (row 9 9 1 1 3 1 1 1 9 5 6 6 9 9 6)
//        (row 6 5 9 1 3 1 3 1 9 5 6 6 9 6 9)
//        (row 6 6 5 9 1 3 3 1 1 9 5 5 9 6 6)
//        (row 9 5 5 9 1 1 1 1 1 1 9 9 9 5 6)
//        (row 5 9 9 9 1 1 1 1 10 10 1 1 1 9 5)
//        (row 5 9 1 1 1 1 1 1 10 9 10 1 1 1 9)
//        (row 9 9 1 1 1 3 3 1 1 10 10 1 3 1 1)
//        (row 1 1 1 3 1 3 10 3 1 1 1 1 3 3 1)
//        (row 1 1 1 1 3 1 9 6 1 1 1 1 3 1 3)
//        (row 1 3 3 1 1 3 9 9 6 1 1 1 3 1 3)
//        (row 1 3 1 3 1 1 1 9 6 1 9 9 10 3 1)
//        (row 3 6 6 3 1 3 3 1 3 1 9 9 6 1 3)
//        (row 1 9 9 6 1 3 1 3 1 3 1 6 6 1 3)
//        (row 1 1 9 9 10 1 3 1 1 3 1 1 3 3 3)
//        (row 6 6 1 1 1 1 1 3 3 3 1 1 1 1 1)
//        (row 9 9 6 1 1 1 1 1 1 1 1 10 10 1 1)
//        (row 1 9 9 10 1 1 1 1 1 1 1 10 9 10 1)
//        (row 1 1 1 1 1 1 1 1 1 1 1 1 10 10 1)
//        (row 3 3 3 1 1 1 1 1 9 9 9 1 1 1 1)
//        (row 3 1 1 3 1 1 1 1 9 5 5 9 1 1 1)
//        (row 3 1 3 1 3 1 9 9 9 5 5 5 9 9 9)
//        (row 1 3 3 1 3 1 9 5 5 9 5 5 9 5 5)
//        (row 9 1 1 1 3 1 9 5 5 5 9 5 9 5 5)
//        (row 5 9 1 1 3 1 1 9 5 5 5 9 9 5 5)
//        (row 5 9 1 1 3 1 1 1 9 9 9 9 5 9 9)
//        (row 9 9 1 1 3 1 1 1 9 5 5 5 9 9 5)
//        (row 5 5 9 1 3 1 3 1 9 5 5 5 9 5 9)
//        (row 5 5 5 9 1 3 3 1 1 9 5 5 9 5 5)
//        (row 9 5 5 9 1 1 1 1 1 1 9 9 9 5 5)
//        (row 5 9 9 9 1 1 1 1 10 10 1 1 1 9 5)
//        (row 5 9 1 1 1 1 1 1 10 9 10 1 1 1 9)
//        (row 9 9 1 1 1 3 3 1 1 10 10 1 3 1 1)
//        (row 1 1 1 3 1 3 1 3 1 1 1 1 3 3 1)
//        (row 1 1 1 1 3 1 1 3 1 1 1 1 3 1 3)
//        (row 1 3 3 1 1 3 3 3 1 1 1 1 3 1 3)
//        (row 1 3 1 3 1 1 1 3 1 1 3 3 1 3 1)
//        (row 3 1 1 3 1 3 3 6 6 1 3 1 3 1 3)
//        (row 1 3 3 3 1 3 1 9 9 6 1 3 1 1 3)
//        (row 1 1 1 1 1 1 3 1 9 9 10 1 3 3 3)
//        (row 1 1 1 1 1 1 1 3 3 3 1 1 1 1 1)))
//
//
//    """
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
    private lazy var parser = JBBParser(str: self.schemeStr)
    private lazy var scheme = Scheme(name: self.parser.name ?? "no name", colors: parser.colors, rows: parser.rows)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("size: ", scheme.rows[0].count)
        
        // register cell TODO:
        // collectionView.
        let nib = UINib(nibName: "cell", bundle: Bundle.main)
        CollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        
        // print(scheme.colors, scheme.name, scheme.rows)
        
//        var horizontalStackViews: [UIStackView] = []
//
//        for row in scheme.rows {
//
//            var buttons: [UIButton] = []
//            for item in row {
//                let curButton = UIButton()
//                curButton.translatesAutoresizingMaskIntoConstraints = false
//                curButton.setTitle(String(item), for: .normal)
//                curButton.setTitleColor(UIColor.black, for: .normal)
//                curButton.backgroundColor = scheme.colors[item]
//                print(scheme.colors[item])
//                buttons.append(curButton)
//            }
//            let stackView = UIStackView(arrangedSubviews: buttons)
//            stackView.distribution = .fillEqually
//            stackView.spacing = 5
//            stackView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.axis = .horizontal
//
//            horizontalStackViews.append(stackView)
////            ScrollView.addSubview(stackView)
////
////            // constraits
////            stackView.leftAnchor.constraint(equalTo: ScrollView.leftAnchor, constant: 0).isActive = true
//        }
//
//        let VerticalStackView = UIStackView(arrangedSubviews: horizontalStackViews)
//
//        VerticalStackView.distribution = .fillEqually
//        VerticalStackView.spacing = 5
//        VerticalStackView.translatesAutoresizingMaskIntoConstraints = false
//        VerticalStackView.axis = .vertical
////
//        view.addSubview(VerticalStackView)
        
        // constraits
//        VerticalStackView.leftAnchor.constraint(equalTo: ScrollView.leftAnchor, constant: 0).isActive = true
//        VerticalStackView.topAnchor.constraint(equalTo: ScrollView.topAnchor, constant: 0).isActive = true
//        VerticalStackView.rightAnchor.constraint(equalTo: ScrollView.rightAnchor, constant: 0).isActive = true
        
//        stackView.axis = .Horizontal

//        stackView.alignment = .Fill
//        stackView.spacing = 5
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(stackView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheme.rows.count * scheme.rows[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellView
        
        let colorIndex = scheme.rows[indexPath.row / scheme.rows[0].count][indexPath.row % scheme.rows[0].count]
        
        // cell.label.text = String(colorIndex)
        cell.label.text = ""
//        cell.backgroundColor = UIColor.brown
        cell.backgroundColor = scheme.colors[colorIndex]
        // print(colorIndex, scheme.colors[colorIndex], cell.backgroundColor!)
        
//        cell.frame.size.width = self.view.frame.size.width / CGFloat(scheme.rows[0].count)
//        cell.frame.size.height = self.view.frame.size.width / CGFloat(scheme.rows[0].count)
//
        // cell.layer.borderWidth = 0.5
        
        // size = ширина экрана/scheme.rows[0].count
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: self.view.frame.size.width / CGFloat(scheme.rows[0].count), height: self.view.frame.size.width / CGFloat(scheme.rows[0].count));
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.CollectionView.frame.size.width / CGFloat(scheme.rows[0].count)  //some width
        let height = width
        
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
}

