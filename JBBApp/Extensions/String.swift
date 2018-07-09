//
//  String.swift
//  JBBApp
//
//  Created by Александр Филимонов on 02/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import Foundation

extension String {
    func isNumber() -> Bool {
        for char in self {
            if char < "0" || char > "9" {
                return false
            }
        }
        return true
    }
}
