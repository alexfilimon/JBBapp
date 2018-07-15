//
//  CustomColor.swift
//  JBBApp
//
//  Created by Александр Филимонов on 01/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class CustomColor {
    
    // MARK: - Properties
    
    var defaultName: String! = nil
    var customName: String?
    var colorValue: UIColor
    
    // MARK: - Init and Deinit
    
    init(with color: UIColor, name customName: String? = nil) {
        self.colorValue = color
        if let customName = customName {
            self.customName = customName
        }
        
        self.defaultName = getDefaultName(with: color)
    }
    
}

// MARK: - Private methods

private extension CustomColor {
    private func getDefaultName(with color: UIColor) -> String {
        let defaultNamesDB = customColorsDB
        
        let rows = defaultNamesDB.split(separator: "\n")
        
        var colorsDB: [(String, UIColor)] = []
        
        for row in rows {
            
            if row.starts(with: "//") {
                continue
            }
            
            let partials = row.split(separator: " ")
            
            var name = ""
            var colorParts: [Int] = []
            
            for part in partials {
                if String(part).isNumber() {
                    colorParts.append(Int(part)!)
                } else {
                    name += String(part) + " "
                }
            }
            
            let curItem: (String, UIColor) = (name, UIColor(red: CGFloat(colorParts[0])/255.0, green: CGFloat(colorParts[1])/255.0, blue: CGFloat(colorParts[2])/255.0, alpha: 1.0))
            
            colorsDB.append(curItem)
            
        }
        
        var comparedValues: [Double] = []
        
        for comparingRow in colorsDB {
            
            guard let rgb1 = color.rgb(), let rgb2 = comparingRow.1.rgb() else { return "" }
            
            let val = sqrt(pow(Double(rgb1.red - rgb2.red), 2.0) + pow(Double(rgb1.green - rgb2.green), 2.0) + pow(Double(rgb1.blue - rgb2.blue), 2.0))
            
            comparedValues.append(val)
        }
        
        guard let minValue = comparedValues.min(), let minIndex = comparedValues.index(of: minValue) else { return "" }
        
        
        
        
        return colorsDB[minIndex].0
    }
}
