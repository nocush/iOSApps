//
//  Dog+CoreDataProperties.swift
//  Lab11
//
//  Created by Mateusz Bartoszek on 23/05/2023.
//
//

import Foundation
import CoreData


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog")
    }

    @NSManaged public var name: String?
    @NSManaged public var yearBirth: Int16
    @NSManaged public var toBreed: Breed?

}

extension Dog : Identifiable {

}
