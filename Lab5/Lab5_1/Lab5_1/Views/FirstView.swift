//
//  FirstView.swift
//  Lab5_1
//
//  Created by Mateusz Bartoszek on 14/03/2023.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView{
            VStack{
                TriangleView(color:.indigo,number:1)
                    .navigationBarTitle("Trójkąt")
                    .offset(y:-40)
                NavigationLink(destination: SecondView(), label:{
                    Text("Następny ekran")
                })
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
