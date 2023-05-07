//
//  Flat.swift
//  Lab7_1
//
//  Created by Mateusz Bartoszek on 27/03/2023.
//

import Foundation

struct Flat{
    var name: String
    var area: Double
    var roomCount: Int
    var isDuplex: Bool
    var photoPath: String
    
    init(name: String, area: Double, roomCount: Int, isDuplex: Bool, photoPath: String) {
        self.name = name
        self.area = area
        self.roomCount = roomCount
        self.isDuplex = isDuplex
        self.photoPath = photoPath
    }
}
