//
//  TiresManager.swift
//  Lab3_2
//
//  Created by Mateusz Bartoszek on 12/03/2023.
//

import Foundation


struct TiresManager{
    var tires: [Tire]
    
    init(){
        self.tires = [
            Tire(firma:"Michelin",dostepnoscRozmiaru: [16:6, 17:2, 18:12]),
            Tire(firma:"Yokohama",dostepnoscRozmiaru: [16:5, 17:8, 18:2]),
            Tire(firma:"Bridgestone",dostepnoscRozmiaru: [16:1, 17:19, 18:5])
        ]
    }
    
    func checkAvailability(firma: String, rozmiar: Int, ilosc: Int)->Bool {
        guard let m = (tires.first{tire in tire.firma == firma}) else{
            return false
        }
        guard let a = m.dostepnoscRozmiaru[rozmiar] else {
            return false
        }
        
        guard a >= ilosc else{
            return false
        }
        return true
    }
    
    func getAllSizes()->[Int] {
        var rozmiary: Set<Int> = Set()
        for tire in tires {
            for rozmiar in tire.dostepnoscRozmiaru.keys {
                rozmiary.insert(rozmiar)
            }
        }
        return Array(rozmiary).sorted()
    }
    
    func getAllManufacturers()->[String]{
        var firmy: Set<String> = Set()
        for tire in tires {
            firmy.insert(tire.firma)
        }
        return Array(firmy).sorted()
    }
}
