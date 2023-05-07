//
//  ContentView.swift
//  Lab9_4
//
//  Created by Mateusz Bartoszek on 07/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var cars: [Car] = [
    Car(model: "Corolla", manufacturer: "Toyota", logo: "toyota"),
    Car(model: "Passat", manufacturer: "Woltzwagen", logo: "wolkswagen"),
    Car(model: "GTR", manufacturer: "Nissan", logo: "nissan"),
    Car(model: "Focus", manufacturer: "Ford", logo: "ford")]
    var body: some View {
        List{
            ForEach(cars, id: \.self) { car in
                Wiersz(car: car)
            }.onDelete(perform:delete)
        }
    }
    
    func delete(at offsets: IndexSet){
        cars.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
