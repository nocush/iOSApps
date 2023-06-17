//
//  ContentView.swift
//  Lab10_2
//
//  Created by Mateusz Bartoszek on 22/05/2023.
//

import SwiftUI
import MapKit

struct Place: Identifiable{
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
}


struct ContentView: View {
    @State var places = [Place(name: "Weii", coordinates: CLLocationCoordinate2D(latitude: 51.23670, longitude: 22.54874))]
    @State var latitude: String = ""
    @State var longitude: String = ""
    @State var name: String = ""
    @State private var coordinate = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 51.23568, longitude: 22.54888),span:MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
    @State var alert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var longPressLocation = CGPoint.zero
    @State var customLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var body: some View {
        VStack{
            GeometryReader{proxy in
                Map(coordinateRegion: $coordinate, annotationItems: places){ place in
                    MapMarker(coordinate: place.coordinates, tint:Color.red)
                    
                }
                .gesture(LongPressGesture(minimumDuration: 0.25)
                    .sequenced(before: DragGesture(minimumDistance: 0, coordinateSpace: .local))
                    .onEnded{ value in
                        switch value{
                        case .second(true, let drag):
                            longPressLocation = drag?.location ?? .zero
                            customLocation = convertTap(at: longPressLocation, for: proxy.size)
                            latitude = String(customLocation.latitude)
                            longitude = String(customLocation.longitude)
                        default:
                            break
                        }
                    })
                .frame(height: UIScreen.main.bounds.size.height / 2,alignment: .center)
                .alert(isPresented:$alert){
                    Alert(title: Text(alertTitle),
                          message: Text(alertMessage))
                }
            }
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
                    if self.checkIfPossible() {
                        self.changeRegion(latitude: Double(self.latitude)!, longitude: Double(self.longitude)!)
                    }
                })
                HStack{
                    Text("Nazwa: ")
                    TextField("Nazwa",text: $name)
                }
                Button("Dodaj adnotację",action:{
                    if self.checkIfPossible(){
                        self.addPlace()
                    }
                })
            }
        }
    }
    private func changeRegion(latitude:Double, longitude: Double){
        coordinate.center.latitude=latitude
        coordinate.center.longitude=longitude
    }
    private func checkIfPossible()->Bool{
        guard let latitudeDouble = Double(latitude) else {
            self.alertTitle = "Latitude"
            self.alertMessage = "Latitude must be of type Double"
            self.alert = true
            return false
        }
        guard let longitudeDouble = Double(longitude) else {
            self.alertTitle = "Longitude"
            self.alertMessage = "Longitude must be of type Double"
            self.alert = true
            return false
        }
        guard latitudeDouble >= -90 && latitudeDouble <= 90 else{
            self.alertTitle = "Latitude"
                        self.alertMessage = "Latitude must be in range [-90, 90]"
                        self.alert = true
                        return false
            
        }
        guard longitudeDouble >= -180 && longitudeDouble <= 180 else{
            self.alertTitle = "Longitude"
                        self.alertMessage = "Longitude must be in range [-180, 180]"
                        self.alert = true
                        return false
        }
        return true
    }
    private func addPlace(){
        places.append(Place(name: name, coordinates: CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)))
    }
    func convertTap(at point: CGPoint, for mapSize: CGSize) -> CLLocationCoordinate2D {
            let lat = coordinate.center.latitude
            let lon = coordinate.center.longitude
            
            let mapCenter = CGPoint(x: mapSize.width/2, y: mapSize.height/2)
            
            // X
            let xValue = (point.x - mapCenter.x) / mapCenter.x
            let xSpan = xValue * coordinate.span.longitudeDelta/2
            
            // Y
            let yValue = (point.y - mapCenter.y) / mapCenter.y
            let ySpan = yValue * coordinate.span.latitudeDelta/2
            
            return CLLocationCoordinate2D(latitude: lat - ySpan, longitude: lon + xSpan)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
