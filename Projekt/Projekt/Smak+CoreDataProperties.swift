//
//  Smak+CoreDataProperties.swift
//  Projekt
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
    @NSManaged public var smakToPudelko: NSSet?

}

// MARK: Generated accessors for smakToPudelko
//extension Smak {
//
//    @objc(addSmakToPudelkoObject:)
//    @NSManaged public func addToSmakToPudelko(_ value: Pudelko)
//
//    @objc(removeSmakToPudelkoObject:)
//    @NSManaged public func removeFromSmakToPudelko(_ value: Pudelko)
//
//    @objc(addSmakToPudelko:)
//    @NSManaged public func addToSmakToPudelko(_ values: NSSet)
//
//    @objc(removeSmakToPudelko:)
//    @NSManaged public func removeFromSmakToPudelko(_ values: NSSet)
//
//}

extension Smak : Identifiable {

}
