//
//  About.swift
//  Projekt
//
//  Created by Mateusz Bartoszek on 27/05/2023.
//

import SwiftUI
import MapKit

struct Place: Identifiable{
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
}

struct About: View {
    @State var places = [Place(name: "Lodziarnia", coordinates: CLLocationCoordinate2D(latitude: 51.24729, longitude: 22.56620))]
    @State var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.24729, longitude: 22.56620),span:MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    var body: some View {
        VStack{
            Text("Godziny otwarcia").font(.title)
            Text("Pn-Pt: 9-20").font(.title2)
            Text("Sb-Nd: 10-20").font(.title2)

            Text("ul. Królewska 2, Lublin").font(.title2)

            Map(coordinateRegion: $location, annotationItems: places){place in MapMarker(coordinate: place.coordinates,tint:Color.blue)}.frame(height:400)
                .offset(y:50)
                .gesture(TapGesture(count:1)
                    .onEnded{_ in
                        if location.span.latitudeDelta > 0.005 {
                            location.span.latitudeDelta = location.span.latitudeDelta * 0.8
                            location.span.longitudeDelta = location.span.longitudeDelta * 0.8
                        }else{
                            location.span.latitudeDelta = 0.05
                            location.span.longitudeDelta = 0.05
                        }
                    })
            
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
