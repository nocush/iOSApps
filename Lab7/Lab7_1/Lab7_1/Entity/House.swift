//
//  House.swift
//  Lab7_1
//
//  Created by Mateusz Bartoszek on 27/03/2023.
//

import Foundation

class House{
    var name: String
    var houseArea: Double
    var roomCount: Int
    var floorCount: Int
    var landArea: Double
    var photoPath: String
    
    init(name: String, houseArea: Double, roomCount: Int, floorCount: Int, landArea: Double, photoPath: String) {
        self.name = name
        self.houseArea = houseArea
        self.roomCount = roomCount
        self.floorCount = floorCount
        self.landArea = landArea
        self.photoPath = photoPath
    }
}
