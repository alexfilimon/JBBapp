//
//  SchemeMO+CoreDataProperties.swift
//  JBBApp
//
//  Created by Александр Филимонов on 05.06.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//
//

import Foundation
import CoreData


extension SchemeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SchemeMO> {
        return NSFetchRequest<SchemeMO>(entityName: "Scheme")
    }

    @NSManaged public var name: String?
    @NSManaged public var colors: String?
    @NSManaged public var rows: String?

}
