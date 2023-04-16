//
//  Flat.swift
//  Lab7_2
//
//  Created by Mateusz Bartoszek on 16/04/2023.
//

import Foundation

struct Flat:Hashable{
    var nazwa: String
    var powierzchnia: Double
    var liczbaPokoi: Int
    var czyDwupoziomowy: Bool
    var zdjecie: String
    
    init(nazwa: String, powierzchnia: Double, liczbaPokoi: Int, czyDwupoziomowy: Bool, zdjecie: String) {
        self.nazwa = nazwa
        self.powierzchnia = powierzchnia
        self.liczbaPokoi = liczbaPokoi
        self.czyDwupoziomowy = czyDwupoziomowy
        self.zdjecie = zdjecie
    }
}
