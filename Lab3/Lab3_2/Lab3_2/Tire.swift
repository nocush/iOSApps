//
//  Tire.swift
//  Lab3_2
//
//  Created by Mateusz Bartoszek on 12/03/2023.
//

import Foundation


struct Tire{
    var firma: String
    var dostepnoscRozmiaru: [Int:Int]
    
    
    init(firma: String, dostepnoscRozmiaru: [Int : Int]) {
        self.firma = firma
        self.dostepnoscRozmiaru = dostepnoscRozmiaru
    }
}
