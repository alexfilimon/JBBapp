//
//  JBBParser.swift
//  JBBApp
//
//  Created by Александр Филимонов on 23.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit
import Foundation

class JBBParser {
    
    var name: String?
    var colors: [UIColor]
    var rows: [[Int]]
    
    init(str: String) {
        
        // parse array of colors
        let colorsStart = str.endIndex(of: "(colors")!
        let colorEnd = str[colorsStart...].index(of: "))")!
        let colorsStr = str[colorsStart..<str.index(colorEnd, offsetBy: 1)]
        colors = colorsStr.components(separatedBy: "\n").filter { $0.count > 0 }.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.map { (cur) -> UIColor in
            let curNew = cur[cur.index(cur.startIndex, offsetBy: 5)..<cur.index(cur.endIndex, offsetBy: -1)]
            let parts = curNew.split(separator: " ").map { Float($0) ?? 0.0 }
            
            return UIColor(red: CGFloat(parts[0]/255.0), green: CGFloat(parts[1]/255.0), blue: CGFloat(parts[2]/255.0), alpha: 1)
        }
        
        // parse rows
        let rowsStart = str.endIndex(of: "(model")!
        let rowsEnd = str[rowsStart...].index(of: "))")!
        let rowsStr = str[rowsStart..<str.index(rowsEnd, offsetBy: 1)]
        rows = rowsStr.components(separatedBy: "\n").filter { $0.count > 0 }.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.map { (cur) -> [Int] in
            let curNew = cur[cur.index(cur.startIndex, offsetBy: 5)..<cur.index(cur.endIndex, offsetBy: -1)]
            
            return curNew.split(separator: " ").map { Int($0) ?? 0 }
        }
        
        name = nil
    }
    
}

extension StringProtocol where Index == String.Index {
    func index<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while start < endIndex, let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func ranges<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while start < endIndex, let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.lowerBound < range.upperBound  ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
