//
//  ContentView.swift
//  Lab10_1
//
//  Created by Mateusz Bartoszek on 22/05/2023.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @State var latitude: String = ""
    @State var longitude: String = ""
    @State var zoom: Double = 0.1
    @State private var coordinate = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 51.23568, longitude: 22.54888),span:MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var body: some View {
        VStack{
            Map(coordinateRegion: $coordinate)
                .frame(height: UIScreen.main.bounds.size.height / 2,alignment: .center)
                .gesture(TapGesture(count:1)
                    .onEnded{ _ in
                        if coordinate.span.latitudeDelta > 0.05 {
                            coordinate.span.latitudeDelta = coordinate.span.latitudeDelta * 0.8
                            coordinate.span.longitudeDelta = coordinate.span.longitudeDelta * 0.8
                        }else {
                            coordinate.span.longitudeDelta = 0.1
                            coordinate.span.latitudeDelta = 0.1
                        }
                    })
            Form{
                HStack{
                    Text("Latitude: ")
                    TextField("Latitude",text: $latitude)
                }
                HStack{
                    Text("Longitude: ")
                    TextField("Longitude",text: $longitude)
                }
                Button("Zmień region",action:{
                    self.changeRegion(latitude: Double(self.latitude)!, longitude: Double(self.longitude)!)
                })
            }
        }
    }
    private func changeRegion(latitude:Double, longitude: Double){
        coordinate.center.latitude=latitude
        coordinate.center.longitude=longitude
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
