//
//  Pudelko+CoreDataProperties.swift
//  test
//
//  Created by Mateusz Bartoszek on 18/06/2023.
//
//

import Foundation
import CoreData


extension Pudelko {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pudelko> {
        return NSFetchRequest<Pudelko>(entityName: "Pudelko")
    }

    @NSManaged public var capacity: Int32
    @NSManaged public var cena: Double
    @NSManaged public var name: String?
    @NSManaged public var smakCount: Int16
    @NSManaged public var toSmak: NSSet?
    @NSManaged public var toZamowienie: Zamowienie?

}

// MARK: Generated accessors for toSmak
extension Pudelko {

    @objc(addToSmakObject:)
    @NSManaged public func addToToSmak(_ value: Smak)

    @objc(removeToSmakObject:)
    @NSManaged public func removeFromToSmak(_ value: Smak)

    @objc(addToSmak:)
    @NSManaged public func addToToSmak(_ values: NSSet)

    @objc(removeToSmak:)
    @NSManaged public func removeFromToSmak(_ values: NSSet)

}

extension Pudelko : Identifiable {

}
