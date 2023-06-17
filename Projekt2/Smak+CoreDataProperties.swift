//
//  Smak+CoreDataProperties.swift
//  Projekt2
//
//  Created by Mateusz Bartoszek on 13/06/2023.
//
//

import Foundation
import CoreData


extension Smak {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Smak> {
        return NSFetchRequest<Smak>(entityName: "Smak")
    }

    @NSManaged public var name: String?

}

extension Smak : Identifiable {

}
