//
//  Breed+CoreDataProperties.swift
//  Lab11
//
//  Created by Mateusz Bartoszek on 23/05/2023.
//
//

import Foundation
import CoreData


extension Breed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Breed> {
        return NSFetchRequest<Breed>(entityName: "Breed")
    }

    @NSManaged public var name: String?
    @NSManaged public var toDog: NSSet?
    
    public var dogArray: [Dog] {
        let set = toDog as? Set<Dog> ?? []
        
        return set.sorted{
            $0.name! < $1.name!
        }
    }

}

// MARK: Generated accessors for toDog
/*extension Breed {

    @objc(addToDogObject:)
    @NSManaged public func addToToDog(_ value: Dog)

    @objc(removeToDogObject:)
    @NSManaged public func removeFromToDog(_ value: Dog)

    @objc(addToDog:)
    @NSManaged public func addToToDog(_ values: NSSet)

    @objc(removeToDog:)
    @NSManaged public func removeFromToDog(_ values: NSSet)

}*/

extension Breed : Identifiable {

}
