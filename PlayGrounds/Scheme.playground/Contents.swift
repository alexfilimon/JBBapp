
import UIKit

class SchemeCell {

    let color: CustomColor
    let colorNumber: Int
    var isRead = false
    let id: Int

    init(color: CustomColor, colorNumber: Int, id: Int) {
        self.color = color
        self.colorNumber = colorNumber
        self.id = id
    }

}
extension SchemeCell: Equatable {
    static func == (lhs: SchemeCell, rhs: SchemeCell) -> Bool {
        return lhs.color == rhs.color
    }
}
extension SchemeCell: CustomStringConvertible {
    var description: String {
        return "\(colorNumber)"
    }
}


class CustomColor {
    let colorValue: UIColor
    let stringValue: String?
    
    init(colorValue color: UIColor, string: String? = nil) {
        self.colorValue = color
        self.stringValue = string
    }
    
    func getStringValue() -> String {
        if let stringValue = self.stringValue {
            return stringValue.lowercased()
        } else {
            return "неопределенный цвет"
        }
    }
}
extension CustomColor: Equatable {
    static func == (lhs: CustomColor, rhs: CustomColor) -> Bool {
        return lhs.colorValue == rhs.colorValue
    }
}




class Scheme {

    var cells: [SchemeCell]
    let offset: Float
    lazy var countCells = { return self.cells.count }
    let countCellsInRow: Int

    
    lazy var structCells: [(Float, [SchemeCell])] = {
        
        var retVal: [(Float, [SchemeCell])] = []
        var curOffset: Float = 0.0
        var i = 0
        
        while i < self.cells.count {
            
            var curArray: [SchemeCell] = []
            var left: Int
            var right: Int
            
            if curOffset == 0.0 {
                left = i
                right = i + self.countCellsInRow
                
            } else {
                left = i
                right = i + self.countCellsInRow - 1
            }
            
            if right > self.countCellsInRow {
                right = self.countCellsInRow
            }
            curArray = Array(self.cells[left..<right])
            
            i = right
            
            retVal.append((offset, curArray))
            curOffset += self.offset
            
        }
        
        return retVal
    }()
    
    func getSchemeCell(byId id: Int) -> SchemeCell? {
        return self.cells.filter({ $0.id == id }).first
    }

    var name: String

    init(name: String, array: [Int], colors: [UIColor], countCellsInRow: Int, offset: Float = 0.5) {
        self.countCellsInRow = countCellsInRow
        self.offset = offset
        self.name = name
        
        self.cells = []
        for (index, cell) in array.enumerated() {
            let customColor = CustomColor(colorValue: colors[cell])
            self.cells.append(SchemeCell(color: customColor, colorNumber: cell, id: index))
        }
    }
    
    lazy var groupedCells: [(SchemeCell, Int, Bool)] = {

        var retVal = [(SchemeCell, Int, Bool)]()

        for item in cells {
            if retVal.count == 0 {
                retVal.append((item, 1, false))
            } else if retVal[retVal.count-1].0 == item {
                retVal[retVal.count-1].1 += 1
            } else {
                retVal.append((item, 1, false))
            }
        }

        return retVal
    }()

}

var scheme1 = Scheme(name: "Схема 1", array: [1, 0, 2, 0, 1, 1, 2], colors: [UIColor.green, UIColor.red, UIColor.black], countCellsInRow: 2)

print(scheme1.groupedCells)







