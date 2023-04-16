//
//  ContentView.swift
//  Lab7_2
//
//  Created by Mateusz Bartoszek on 16/04/2023.
//

import SwiftUI

struct ContentView: View {
    private let houseManager = HouseManager()
    private let flatManager = FlatManager()
    var body: some View {
        NavigationView{
            VStack{
                Text("Nieruchomości")
                List{
                    Section("Houses"){
                        ForEach(houseManager.getAllHouses(),id: \.self){ house in NavigationLink(destination: HouseView(house: house), label:{
                            HStack{
                                Text(house.nazwa)
                                Spacer()
                                Image(house.zdjecie).resizable()
                                    .frame(width:150,height: 50)
                            }})}}
                    Section("Flats"){
                        ForEach(flatManager.getAllFlats(),id: \.self){flat in NavigationLink(destination: FlatView(flat: flat), label:{
                            HStack{
                                Text(flat.nazwa)
                                Spacer()
                                Image(flat.zdjecie).resizable()
                                    .frame(width:150,height: 50)
                            }})}
                    }
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
