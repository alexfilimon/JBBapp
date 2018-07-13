//
//  UIColor.swift
//  JBBApp
//
//  Created by Александр Филимонов on 02/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

extension UIColor {
    
    func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
    
    func isLight() -> Bool? {
        guard let rgb = rgb() else { return nil }
        let newRGB = (red: 0.299 * Double(rgb.red), green: 0.587 * Double(rgb.green), blue: 0.114 * Double(rgb.blue))
        let newRGBsum = newRGB.red + newRGB.green + newRGB.blue
        if (1.0 - newRGBsum / 255.0 < 0.5) {
            return true
        } else {
            return false
        }
    }
}
