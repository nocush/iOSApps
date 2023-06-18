//
//  Zamowienie+CoreDataProperties.swift
//  test
//
//  Created by Mateusz Bartoszek on 18/06/2023.
//
//

import Foundation
import CoreData


extension Zamowienie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Zamowienie> {
        return NSFetchRequest<Zamowienie>(entityName: "Zamowienie")
    }

    @NSManaged public var adres: String?
    @NSManaged public var imie: String?
    @NSManaged public var kwota: Double
    @NSManaged public var nazwisko: String?
    @NSManaged public var telefon: Int32
    @NSManaged public var toPudelko: NSSet?

}

// MARK: Generated accessors for toPudelko
extension Zamowienie {

    @objc(addToPudelkoObject:)
    @NSManaged public func addToToPudelko(_ value: Pudelko)

    @objc(removeToPudelkoObject:)
    @NSManaged public func removeFromToPudelko(_ value: Pudelko)

    @objc(addToPudelko:)
    @NSManaged public func addToToPudelko(_ values: NSSet)

    @objc(removeToPudelko:)
    @NSManaged public func removeFromToPudelko(_ values: NSSet)

}

extension Zamowienie : Identifiable {

}
