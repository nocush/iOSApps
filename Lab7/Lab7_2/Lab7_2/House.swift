//
//  House.swift
//  Lab7_2
//
//  Created by Mateusz Bartoszek on 16/04/2023.
//

import Foundation

struct House: Hashable{
    var nazwa: String
    var powierzchnia: Double
    var liczbaPokoi: Int
    var wielkoscDzialki: Double
    var liczbaPieter: Int
    var zdjecie: String
    
    init(nazwa: String, powierzchnia: Double, liczbaPokoi: Int, wielkoscDzialki: Double, liczbaPieter: Int, zdjecie: String) {
        self.nazwa = nazwa
        self.powierzchnia = powierzchnia
        self.liczbaPokoi = liczbaPokoi
        self.wielkoscDzialki = wielkoscDzialki
        self.liczbaPieter = liczbaPieter
        self.zdjecie = zdjecie
    }
}
