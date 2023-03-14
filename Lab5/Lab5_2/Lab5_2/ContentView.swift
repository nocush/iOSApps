//
//  ContentView.swift
//  Lab5_2
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: ToyotaView(), label:{
                    Text("Toyota")
                }).frame(width:200,height:40)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                NavigationLink(destination: HondaView(), label:{
                    Text("Honda")
                }).frame(width:200,height:40)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                NavigationLink(destination: NissanView(), label:{
                    Text("Nissan")
                }).frame(width:200,height:40)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
