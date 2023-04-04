//
//  Book.swift
//  Lab6_3
//
//  Created by Mateusz Bartoszek on 04/04/2023.
//

import Foundation

struct Book{
    var imie: String
    var nazwisko: String
    var tytul: String
    var dostepnosc : Int
    
    init(imie: String, nazwisko: String, tytul: String, dostepnosc: Int) {
        self.imie = imie
        self.nazwisko = nazwisko
        self.tytul = tytul
        self.dostepnosc = dostepnosc
    }
}
