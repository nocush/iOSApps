//
//  Wiersz.swift
//  Lab9_4
//
//  Created by Mateusz Bartoszek on 07/05/2023.
//

import SwiftUI

struct Wiersz: View {
    @State var car: Car
    var body: some View {
        HStack{
            Image(car.logo)
                .resizable()
                .frame(width:70,height:50)
            VStack{
                Text(car.manufacturer)
                Text(car.model)
            }
        }
    }
}

struct Wiersz_Previews: PreviewProvider {
    static var previews: some View {
        Wiersz(car: Car(model: "Corolla", manufacturer: "Toyota", logo: "toyota"))
    }
}
