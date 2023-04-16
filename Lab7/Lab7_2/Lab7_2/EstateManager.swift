//
//  EstateManager.swift
//  Lab7_2
//
//  Created by Mateusz Bartoszek on 16/04/2023.
//

import Foundation

struct HouseManager{
    var Houses: [House]
    
    init(){
        self.Houses = [
            House(nazwa: "House 1", powierzchnia: 127.8, liczbaPokoi: 3, wielkoscDzialki: 170.4, liczbaPieter: 1, zdjecie: "house1"),
            House(nazwa: "House 2", powierzchnia: 227.8, liczbaPokoi: 5, wielkoscDzialki: 270.4, liczbaPieter: 2, zdjecie: "house2"),
            House(nazwa: "House 3", powierzchnia: 337.8, liczbaPokoi: 7, wielkoscDzialki: 370.4, liczbaPieter: 2, zdjecie: "house3")]
    }
    
    func getAllHouses()->[House]{
        return Houses
    }
    
    }

struct FlatManager{
    var Flats: [Flat]
    
    init(){
        self.Flats = [
            Flat(nazwa: "Flat 1", powierzchnia: 92.37, liczbaPokoi: 4, czyDwupoziomowy: true, zdjecie: "flat1"),
            Flat(nazwa: "Flat 2", powierzchnia: 54.42, liczbaPokoi: 3, czyDwupoziomowy: false, zdjecie: "flat2"),
            Flat(nazwa: "Flat 3", powierzchnia: 25.4, liczbaPokoi: 1, czyDwupoziomowy: false, zdjecie: "flat3")]
        
    }
    
    func getAllFlats()->[Flat]{
        return Flats
    }
}
